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
                'total_milestones' => sizeof($original) * -1,
                'last_update_mode' => 'Event',
                'date_modified' => date("Y-m-d H:i:s")
            ));
        }

        if ($updated)
        {
            StatisticsAllController::updateStats(array(
                'total_milestones' => sizeof($updated),
                'last_update_mode' => 'Event',
                'date_modified' => date("Y-m-d H:i:s")
            ));
        }
    }
}