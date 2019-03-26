<?php

namespace App\Http\Controllers;

use App\Models\TeachingPlan;
use Illuminate\Http\Request;

class TeachingPlanController extends Controller
{
    public function getAll(Request $request) {
        $deleted = $request['deleted'] ?? 0;
        return response()->json(
            TeachingPlan::where(['deleted' => (int)$deleted])
                ->orderBy('target_date', 'desc')
                ->get());
    }

    public function get($id) {
        return response()->json(TeachingPlan::find($id));
    }

    public function create(Request $request) {
        $this->validateRequest($request);
        $requestArray = $request->all();
        $teachingPlan = TeachingPlan::create($requestArray);
        $this->updateStats(null, $requestArray);
        return response()->json($teachingPlan, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request);
        $teachingPlan = TeachingPlan::findOrFail($id);
        $original = $teachingPlan->toArray();
        $updated = $request->all();
        $teachingPlan->update($updated);
        $this->updateStats($original, $updated);
        return response()->json($teachingPlan, 200);
    }

    public function delete($id) {
        TeachingPlan::findOrFail($id)->delete();
        return response('Deleted Successfully', 200);
    }

    function validateRequest(Request $request) {
        $this->validate($request, [
            'educator_id' => 'required',
            'child_id' => 'required',
            'title' => 'required',
            'details' => 'required',
            'target_outcome_id' => 'required',
            'target_date' => 'required'
        ]);
    }

    function updateStats($original, $updated) {
        if ($original) {
            StatisticsAllController::updateStats(array(
                'total_itps' => -1,
                'total_itps_open' => $original['done'] === 0 ? -1 : 0,
                'last_update_mode' => 'Event',
                'date_modified' => $updated['date_modified']
            ));
        }

        if ($updated['deleted'] === 0)
        {
            StatisticsAllController::updateStats(array(
                'total_itps' => 1,
                'total_itps_open' => $updated['done'] === 0 ? 1 : 0,
                'last_update_mode' => 'Event',
                'date_modified' => $updated['date_modified']
            ));
        }
    }
}