<?php

namespace App\Http\Controllers;

use DB;
use App\Models\Child;
use App\Models\Milestone;
use App\Models\Observation;
use App\Models\StatisticsChild;
use App\Models\StatisticsChildMilestonesPending;
use App\Models\StatisticsChildObservationsDue;
use App\Models\StatisticsChildSeekAdvice;
use App\Models\TeachingPlan;
use App\Utilities\MilestonesUtilities;
use Illuminate\Http\Request;

class StatisticsController extends Controller
{
    public function update() {
        $this->updateChildrenStats();
        return response('Completed Successfully', 200);
    }

    private function updateChildrenStats() {
        // Cleanup chils statistics table
        StatisticsChild::truncate();
        StatisticsChildSeekAdvice::truncate();
        StatisticsChildMilestonesPending::truncate();
        StatisticsChildObservationsDue::truncate();

        // Build child statistics
        foreach(Child::get() as $child) {
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
                        (($pending_milestones != '') ? '\n' : '') .
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