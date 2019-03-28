<?php

namespace App\Http\Controllers;

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

        $this->updateStats($original, $updated);

        return response()->json('Milestones were successfully set.', 200);
    }

    function updateStats($original, $updated) {
        if ($original) {
            StatisticsAllController::updateStats(array(
                'total_milestones' => sizeof($original) * -2,
                'last_update_mode' => 'Event',
                'date_modified' => date("Y-m-d H:i:s")
            ));
            if (sizeof($original) > 0) {
                $milestonesCount = array_count_values(array_column($original, 'developmental_area'));
                StatisticsChildController::updateStats($original[0]['child_id'], array(
                    'total_milestones' => sizeof($original) * -2,
                    'total_milestones_physical' => array_key_exists("Physical", $milestonesCount) ?  $milestonesCount['Physical'] * -2 : 0,
                    'total_milestones_social' => array_key_exists("Social", $milestonesCount) ?  $milestonesCount['Social'] * -2 : 0,
                    'total_milestones_emotional' => array_key_exists("Emotional", $milestonesCount) ?  $milestonesCount['Emotional'] * -2 : 0,
                    'total_milestones_cognitive' => array_key_exists("Cognitive", $milestonesCount) ?  $milestonesCount['Cognitive'] * -2 : 0,
                    'total_milestones_Language' => array_key_exists("Language", $milestonesCount) ?  $milestonesCount['Language'] * -2 : 0,
                    'total_milestones_seek_advice' => array_key_exists("Seek advice", $milestonesCount) ?  $milestonesCount['Seek advice'] * -2 : 0,
                    'last_update_mode' => 'Event',
                    'date_modified' => date("Y-m-d H:i:s")
                ));
            }
        }

        if ($updated)
        {
            StatisticsAllController::updateStats(array(
                'total_milestones' => sizeof($updated),
                'last_update_mode' => 'Event',
                'date_modified' => date("Y-m-d H:i:s")
            ));
            if (sizeof($updated) > 0) {
                $milestonesCount = array_count_values(array_column($updated, 'developmental_area'));
                StatisticsChildController::updateStats($updated[0]['child_id'], array(
                    'total_milestones' => sizeof($updated),
                    'total_milestones_physical' => array_key_exists("Physical", $milestonesCount) ?  $milestonesCount['Physical'] : 0,
                    'total_milestones_social' => array_key_exists("Social", $milestonesCount) ?  $milestonesCount['Social'] : 0,
                    'total_milestones_emotional' => array_key_exists("Emotional", $milestonesCount) ?  $milestonesCount['Emotional'] : 0,
                    'total_milestones_cognitive' => array_key_exists("Cognitive", $milestonesCount) ?  $milestonesCount['Cognitive'] : 0,
                    'total_milestones_Language' => array_key_exists("Language", $milestonesCount) ?  $milestonesCount['Language'] : 0,
                    'total_milestones_seek_advice' => array_key_exists("Seek advice", $milestonesCount) ?  $milestonesCount['Seek advice']  : 0,
                    'last_update_mode' => 'Event',
                    'date_modified' => date("Y-m-d H:i:s")
                ));
            }
        }
    }
}