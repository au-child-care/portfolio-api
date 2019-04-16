<?php

namespace App\Http\Controllers;

use DB;
use App\Models\Centre;
use App\Models\Child;
use App\Models\Educator;
use App\Models\EducatorAssignment;
use App\Models\Milestone;
use App\Models\Observation;
use App\Models\ParentGuardian;
use App\Models\StatisticsAll;
use App\Models\StatisticsChild;
use App\Models\StatisticsChildMilestonesPending;
use App\Models\StatisticsChildObservationsDue;
use App\Models\StatisticsChildSeekAdvice;
use App\Models\StatisticsEducator;
use App\Models\StatisticsEducatorTracking;
use App\Models\TeachingPlan;
use App\Utilities\MilestonesUtilities;
use Illuminate\Http\Request;

class StatisticsController extends Controller
{
    public function update($centre_id) {
        $this->updateChildrenStats($centre_id);
        $this->updateEducatorsStats($centre_id);
        $this->updateAllStats($centre_id);
        return response('Completed Successfully', 200);
    }

    public function updateAll() {
        foreach(Centre::where(['active' => 1])->get() as $centre) {
            $this->updateChildrenStats($centre['id']);
            $this->updateEducatorsStats($centre['id']);
            $this->updateAllStats($centre['id']);
        }
        return response('Completed Successfully', 200);
    }

    private function updateChildrenStats($centre_id) {
        // Get children
        $children = Child::where([
            'centre_id' => $centre_id
        ])->get();
        $encodedResult  = json_encode($children);
        $arrayResult = json_decode($encodedResult, true);
        $ids = array_column($arrayResult, 'id');

        // Cleanup child statistics tables
        StatisticsChild::wherein('child_id', $ids)->delete();
        StatisticsChildSeekAdvice::wherein('child_id', $ids)->delete();
        StatisticsChildMilestonesPending::wherein('child_id', $ids)->delete();
        StatisticsChildObservationsDue::wherein('child_id', $ids)->delete();

        // Build child statistics
        foreach($children as $child) {
            if ($child['deleted'] == 0) {
                $milestones = Milestone::where(['child_id' => $child['id']])->get();
                $observations = Observation::where([
                    'child_id' => $child['id'],
                    'published' => 1,
                    'deleted' => 0
                ])->get();
                $teachingPlans = TeachingPlan::where([
                    'child_id' => $child['id'],
                    'deleted' => 0
                ])->get();

                // Child statistics
                StatisticsChild::create([
                    'child_id' => $child['id'],
                    'total_milestones' => $milestones->count(),
                    'total_observations' => $observations->count(),
                    'total_itps' => $teachingPlans->count(),
                    'total_itps_open' => $teachingPlans->where('done', 0)->count(),
                    'total_milestones_physical' => $milestones->where('developmental_area', 'Physical')->count(),
                    'total_milestones_social' => $milestones->where('developmental_area', 'Social')->count(),
                    'total_milestones_emotional' => $milestones->where('developmental_area', 'Emotional')->count(),
                    'total_milestones_cognitive' => $milestones->where('developmental_area', 'Cognitive')->count(),
                    'total_milestones_language' => $milestones->where('developmental_area', 'Language')->count(),
                    'total_milestones_seek_advice' => $milestones->where('developmental_area', 'Seek advice')->count(),
                    'total_observations_outcome1' => $observations->where('outcome_id', 1)->count(),
                    'total_observations_outcome2' => $observations->where('outcome_id', 2)->count(),
                    'total_observations_outcome3' => $observations->where('outcome_id', 3)->count(),
                    'total_observations_outcome4' => $observations->where('outcome_id', 4)->count(),
                    'total_observations_outcome5' => $observations->where('outcome_id', 5)->count(),
                    'last_update_mode'=> 'FullUpdate',
                    'date_modified'=> date('Y-m-d H:i:s')
                ]);

                // Child seeking advice statistics
                if ($milestones->where('developmental_area', 'Seek advice')->count() > 0) {
                    foreach($milestones->where('developmental_area', 'Seek advice')->groupBy('age_group') as $age_group) {
                        StatisticsChildSeekAdvice::create([
                            'child_id' => $child['id'],
                            'name' => $child['first_name'] . ' ' . $child['last_name'],
                            'current_group' => $child['group'],
                            'milestone_age_group' => $age_group[0]['age_group'],
                            'count' =>sizeof($age_group),
                            'last_update_mode'=> 'FullUpdate',
                            'date_modified'=> date('Y-m-d H:i:s')
                        ]);
                    }
                }

                // Child pending milestones stats
                $birthday = new \DateTime($child['birthday']);
                $childMonths = ((new \DateTime(date('Y-m-d')))->diff($birthday)->y * 12) + (new \DateTime(date('Y-m-d')))->diff($birthday)->m;
                $pending_milestones = '';
                $milestonesQuota = array_filter(MilestonesUtilities::getMilestonesQuota(), function($element) use ($childMonths) {
                    return $element['min_month'] <= $childMonths && $element['max_month'] >= $childMonths;
                });
                $pendingMilestonesTotal = 0;
                foreach($milestonesQuota as $quota) {
                    $notAchieved = $quota['total'] - $milestones->where([                    
                        'age_group' => $quota['age_group'],
                        'developmental_area' => $quota['developmental_area']
                    ])->count();
                    $pendingMilestonesTotal += $notAchieved;
                    if ($notAchieved > 0) {
                        $pending_milestones = $pending_milestones . 
                            (($pending_milestones != '') ? ', ' : '') .
                            $quota['developmental_area'] . ': ' . $notAchieved;
                    }
                }
                if ($pendingMilestonesTotal > 0) {
                    StatisticsChildMilestonesPending::create([
                        'child_id' => $child['id'],
                        'name' => $child['first_name'] . ' ' . $child['last_name'],
                        'current_group' => $child['group'],
                        'current_age_group' => array_pop($milestonesQuota)['age_group'],
                        'pending_milestones' => $pending_milestones,
                        'total' => $pendingMilestonesTotal,
                        'last_update_mode'=> 'FullUpdate',
                        'date_modified'=> date('Y-m-d H:i:s')
                    ]);
                }

                // Child observations due stats
                $lastObservation = is_null($child['last_observation_activity']) ? (new \DateTime())->setTimestamp(0) : new \DateTime($child['last_observation_activity']);
                $lastObservationMonths = ((new \DateTime(date('Y-m-d')))->diff($lastObservation)->y * 12) + (new \DateTime(date('Y-m-d')))->diff($lastObservation)->m;
                if ($lastObservationMonths > 0) {
                    StatisticsChildObservationsDue::create([
                        'child_id' => $child['id'],
                        'name' => $child['first_name'] . ' ' . $child['last_name'],
                        'group' => $child['group'],
                        'last_observation' => $child['last_observation_activity'],
                        'last_update_mode'=> 'FullUpdate',
                        'date_modified'=> date('Y-m-d H:i:s')
                    ]);
                }
            }
        }
    }

    private function updateEducatorsStats($centre_id) {
        // Get children
        $educators = Educator::where([
            'centre_id' => $centre_id
        ])->get();
        $encodedResult  = json_encode($educators);
        $arrayResult = json_decode($encodedResult, true);
        $ids = array_column($arrayResult, 'id');

        // Cleanup educator statistics tables
        StatisticsEducator::wherein('educator_id', $ids)->delete();
        StatisticsEducatorTracking::wherein('educator_id', $ids)->delete();
        
        // Build educator statistics
        foreach($educators as $educator) {
            if ($educator['deleted'] == 0) {
                $milestones = Milestone::where(['educator_id' => $educator['id']])->get();
                $observations = Observation::where([
                    'educator_id' => $educator['id'],
                    'deleted' => 0
                ])->get();
                $teachingPlans = TeachingPlan::where([
                    'educator_id' => $educator['id'],
                    'deleted' => 0
                ])->get();
                $assignment = EducatorAssignment::where([
                    'educator_id' => $educator['id']
                ])->get();
                $arrayResult = json_decode($assignment, true);
                $childIds = array_column($arrayResult, 'child_id');
                $children = Child::findMany($childIds)->toArray();
                $childrenStatsSeekAdvice = StatisticsChildSeekAdvice::findMany($childIds)->toArray();
                $childrenStatsMilestonesPending = StatisticsChildMilestonesPending::findMany($childIds)->toArray();
                $childrenStatsObservationsDue = StatisticsChildObservationsDue::findMany($childIds)->toArray();

                // Educator statistics
                StatisticsEducator::create([
                    'educator_id' => $educator['id'],
                    'total_milestones' => $milestones->count(),
                    'total_observations' => $observations->count(),
                    'total_observations_unpublished' => $observations->where('published', 0)->count(),
                    'total_itps' => $teachingPlans->count(),
                    'total_itps_open' => $teachingPlans->where('done', 0)->count(),
                    'total_children' => $assignment->count(),
                    'total_milestones_physical' => $milestones->where('developmental_area', 'Physical')->count(),
                    'total_milestones_social' => $milestones->where('developmental_area', 'Social')->count(),
                    'total_milestones_emotional' => $milestones->where('developmental_area', 'Emotional')->count(),
                    'total_milestones_cognitive' => $milestones->where('developmental_area', 'Cognitive')->count(),
                    'total_milestones_language' => $milestones->where('developmental_area', 'Language')->count(),
                    'total_milestones_seek_advice' => $milestones->where('developmental_area', 'Seek advice')->count(),
                    'total_observations_outcome1' => $observations->where('outcome_id', 1)->count(),
                    'total_observations_outcome2' => $observations->where('outcome_id', 2)->count(),
                    'total_observations_outcome3' => $observations->where('outcome_id', 3)->count(),
                    'total_observations_outcome4' => $observations->where('outcome_id', 4)->count(),
                    'total_observations_outcome5' => $observations->where('outcome_id', 5)->count(),
                    'last_update_mode'=> 'FullUpdate',
                    'date_modified'=> date('Y-m-d H:i:s')
                ]);
                
                // Educator tracking statistics
                StatisticsEducatorTracking::create([
                    'educator_id' => $educator['id'],
                    'name' => $educator['first_name'] . ' ' . $educator['last_name'],
                    'total_milestones' => $milestones->count(),
                    'groups_handled' => join(', ', array_unique(array_column($children, 'group'))),
                    'total_children' => $assignment->count(),
                    'total_children_seeking_advice' => sizeof(array_unique(array_column($childrenStatsSeekAdvice, 'child_id'))),
                    'total_children_milestones_pending' => sizeof($childrenStatsMilestonesPending),
                    'total_children_observations_due' => sizeof($childrenStatsObservationsDue),
                    'total_milestones' => $milestones->count(),
                    'total_observations' => $observations->count(),
                    'total_itps' => $teachingPlans->count(),
                    'last_update_mode'=> 'FullUpdate',
                    'date_modified'=> date('Y-m-d H:i:s')
                ]);
            }
        }
    }

    private function updateAllStats($centre_id) {
        // Cleanup all statistics table
        $centreStats = StatisticsAll::find($centre_id);
        if ($centreStats != null) {
            $centreStats->delete();
        }

        $centre = Centre::find($centre_id);

        if ($centre && $centre['active'] == 1) {
            $encodedResult  = json_encode(Child::where([
                'centre_id' => $centre_id
            ])->get());
            $arrayResult = json_decode($encodedResult, true);
            $ids = array_column($arrayResult, 'id');

            $milestones = Milestone::wherein('child_id', $ids);
            $observations = Observation::wherein('child_id', $ids)
                ->where(['deleted' => 0])
                ->get();
            $teachingPlans = TeachingPlan::wherein('child_id', $ids)
                ->where(['deleted' => 0])
                ->get();
            $educators = Educator::where(['deleted' => 0, 'centre_id' => $centre_id])->get();
            $parentsGuardians = ParentGuardian::where(['deleted' => 0, 'centre_id' => $centre_id])->get();
            $children = Child::where(['deleted' => 0, 'centre_id' => $centre_id])->get();

            // All statistics
            StatisticsAll::create([
                'centre_id' => $centre_id,
                'total_milestones' => $milestones->count(),
                'total_observations' => $observations->count(),
                'total_itps' => $teachingPlans->count(),
                'total_itps_open' => $teachingPlans->where('done', 0)->count(),
                'total_parents_guardians' => $parentsGuardians->count(),
                'total_parents' => $parentsGuardians->where('type', 'Parent')->count(),
                'total_guardians' => $parentsGuardians->where('type', 'Guardian')->count(),
                'total_children' => $children->count(),
                'total_babies' => $children->where('group', 'Babies')->count(),
                'total_senior_babies' => $children->where('group', 'Senior Babies')->count(),
                'total_toddlers' => $children->where('group', 'Toddlers')->count(),
                'total_juniors' => $children->where('group', 'Juniors')->count(),
                'total_kinders' => $children->where('group', 'Kinders')->count(),
                'total_educators' => $educators->count(),
                'last_update_mode'=> 'FullUpdate',
                'date_modified'=> date('Y-m-d H:i:s')
            ]);
        }
    }
}