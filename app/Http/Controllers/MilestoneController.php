<?php

namespace App\Http\Controllers;

use App\Models\Child;
use App\Models\Milestone;
use Illuminate\Http\Request;

class MilestoneController extends Controller
{
    public function getByChild($id) {
        return response()->json(
            Milestone::where(['child_id' => $id])
                ->get());
    }

    public function setByChild(Request $request) {
        $original = Milestone::where(['child_id' => (int)$request['id']])->get()->toArray();
        $updated = $request->all();

        Milestone::where(['child_id' => (int)$request['id']])->delete();
        foreach ($updated as $current) {
            Milestone::create($current);
        }

        $child = Child::find((int)$request['id']);

        $this->updateStats($child['centre_id'], $original, $updated);

        return response()->json('Milestones were successfully set.', 200);
    }

    function updateStats($centre_id, $original, $updated) {
        if ($original) {
            $updatePayload = array(
                'total_milestones' => sizeof($original) * -1,
                'last_update_mode' => 'Event',
                'date_modified' => date("Y-m-d H:i:s")
            );

            StatisticsAllController::updateStats($centre_id, $updatePayload);

            if (sizeof($original) > 0) {
                $milestonesCount = array_count_values(array_column($original, 'developmental_area'));
                $updatePayload['total_milestones_physical'] = array_key_exists("Physical", $milestonesCount) ?  $milestonesCount['Physical'] * -1 : 0;
                $updatePayload['total_milestones_social'] = array_key_exists("Social", $milestonesCount) ?  $milestonesCount['Social'] * -1 : 0;
                $updatePayload['total_milestones_emotional'] = array_key_exists("Emotional", $milestonesCount) ?  $milestonesCount['Emotional'] * -1 : 0;
                $updatePayload['total_milestones_cognitive'] = array_key_exists("Cognitive", $milestonesCount) ?  $milestonesCount['Cognitive'] * -1 : 0;
                $updatePayload['total_milestones_language'] = array_key_exists("Language", $milestonesCount) ?  $milestonesCount['Language'] * -1 : 0;
                $updatePayload['total_milestones_seek_advice'] = array_key_exists("Seek advice", $milestonesCount) ?  $milestonesCount['Seek advice'] * -1 : 0;

                StatisticsChildController::updateStats($original[0]['child_id'], $updatePayload);
                
                $educator_ids = array_unique(array_column($original, 'educator_id'));
                foreach($educator_ids as $educator_id) {
                    $educatorMilestones = array_filter($original, function($element) use ($educator_id) {
                        return $element['educator_id'] == $educator_id;
                    });
                    $milestonesCount = array_count_values(array_column($educatorMilestones, 'developmental_area'));
                    $updatePayload = array(
                        'total_milestones' => sizeof($educatorMilestones) * -1,
                        'last_update_mode' => 'Event',
                        'date_modified' => date("Y-m-d H:i:s"),
                        'total_milestones_physical' => array_key_exists("Physical", $milestonesCount) ?  $milestonesCount['Physical'] * -1 : 0,
                        'total_milestones_social' => array_key_exists("Social", $milestonesCount) ?  $milestonesCount['Social'] * -1 : 0,
                        'total_milestones_emotional' => array_key_exists("Emotional", $milestonesCount) ?  $milestonesCount['Emotional'] * -1 : 0,
                        'total_milestones_cognitive' => array_key_exists("Cognitive", $milestonesCount) ?  $milestonesCount['Cognitive'] * -1 : 0,
                        'total_milestones_language' => array_key_exists("Language", $milestonesCount) ?  $milestonesCount['Language'] * -1 : 0,
                        'total_milestones_seek_advice' => array_key_exists("Seek advice", $milestonesCount) ?  $milestonesCount['Seek advice'] * -1 : 0,
                    );
                
                    StatisticsEducatorController::updateStats($educator_id, $updatePayload); 
                }
            }
        }

        if ($updated) {
            $updatePayload = array(
                'total_milestones' => sizeof($updated),
                'last_update_mode' => 'Event',
                'date_modified' => date("Y-m-d H:i:s")
            );

            StatisticsAllController::updateStats($centre_id, $updatePayload);

            if (sizeof($updated) > 0) {
                $milestonesCount = array_count_values(array_column($updated, 'developmental_area'));
                $updatePayload['total_milestones_physical'] = array_key_exists("Physical", $milestonesCount) ?  $milestonesCount['Physical'] : 0;
                $updatePayload['total_milestones_social'] = array_key_exists("Social", $milestonesCount) ?  $milestonesCount['Social'] : 0;
                $updatePayload['total_milestones_emotional'] = array_key_exists("Emotional", $milestonesCount) ?  $milestonesCount['Emotional'] : 0;
                $updatePayload['total_milestones_cognitive'] = array_key_exists("Cognitive", $milestonesCount) ?  $milestonesCount['Cognitive'] : 0;
                $updatePayload['total_milestones_language'] = array_key_exists("Language", $milestonesCount) ?  $milestonesCount['Language'] : 0;
                $updatePayload['total_milestones_seek_advice'] = array_key_exists("Seek advice", $milestonesCount) ?  $milestonesCount['Seek advice'] : 0;

                StatisticsChildController::updateStats($updated[0]['child_id'], $updatePayload);
                
                $educator_ids = array_unique(array_column($updated, 'educator_id'));
                foreach($educator_ids as $educator_id) {
                    $educatorMilestones = array_filter($updated, function($element) use ($educator_id) {
                        return $element['educator_id'] == $educator_id;
                    });
                    $milestonesCount = array_count_values(array_column($educatorMilestones, 'developmental_area'));
                    $updatePayload = array(
                        'total_milestones' => sizeof($educatorMilestones),
                        'last_update_mode' => 'Event',
                        'date_modified' => date("Y-m-d H:i:s"),
                        'total_milestones_physical' => array_key_exists("Physical", $milestonesCount) ?  $milestonesCount['Physical'] : 0,
                        'total_milestones_social' => array_key_exists("Social", $milestonesCount) ?  $milestonesCount['Social'] : 0,
                        'total_milestones_emotional' => array_key_exists("Emotional", $milestonesCount) ?  $milestonesCount['Emotional'] : 0,
                        'total_milestones_cognitive' => array_key_exists("Cognitive", $milestonesCount) ?  $milestonesCount['Cognitive'] : 0,
                        'total_milestones_language' => array_key_exists("Language", $milestonesCount) ?  $milestonesCount['Language'] : 0,
                        'total_milestones_seek_advice' => array_key_exists("Seek advice", $milestonesCount) ?  $milestonesCount['Seek advice'] : 0,
                    );
                
                    StatisticsEducatorController::updateStats($educator_id, $updatePayload); 
                }
            }
        }
    }
}