<?php

namespace App\Http\Controllers;

use App\Models\Child;
use App\Models\TeachingPlan;
use Illuminate\Http\Request;

class TeachingPlanController extends Controller
{
    public function getAll(Request $request) {
        $deleted = $request['deleted'] ?? 0;
        $centre_id = $request['centre_id'] ?? 0;

        $encodedResult  = json_encode(Child::where(['centre_id' => $centre_id])->get());
        $arrayResult = json_decode($encodedResult, true);
        $ids = array_column($arrayResult, 'id');

        return response()->json(
            TeachingPlan::wherein('child_id', $ids)
                ->where(['deleted' => (int)$deleted])
                ->orderBy('target_date', 'desc')
                ->get());
    }
    
    public function getAllByChildIds($ids) {
        return response()->json(
            TeachingPlan::wherein('child_id', array_map('intval', explode(',', $ids)))
                ->where(['deleted' => 0])
                ->orderBy('target_date', 'desc')
                ->get());
    }
    
    public function getAllByEducatorId($id) {
        return response()->json(
            TeachingPlan::where([
                    'deleted' => 0,
                    'educator_id' => $id
                ])
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
        
        $child = Child::find((int)$request['child_id']);

        $this->updateStats($child['centre_id'], null, $requestArray);
        return response()->json($teachingPlan, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request);
        $teachingPlan = TeachingPlan::findOrFail($id);
        $original = $teachingPlan->toArray();
        $updated = $request->all();
        $teachingPlan->update($updated);
        
        $child = Child::find((int)$request['child_id']);

        $this->updateStats($child['centre_id'], $original, $updated);
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

    function updateStats($centre_id, $original, $updated) {
        if ($original) {
            $updatePayload = array(
                'total_itps' => -1,
                'total_itps_open' => $original['done'] == 0 ? -1 : 0,
                'last_update_mode' => 'Event',
                'date_modified' => $updated['date_modified']
            );

            StatisticsAllController::updateStats($centre_id, $updatePayload);
            StatisticsChildController::updateStats($original['child_id'], $updatePayload); 
            StatisticsEducatorController::updateStats($updated['educator_id'], $updatePayload); 
        }

        if ($updated['deleted'] == 0)
        {
            $updatePayload = array(
                'total_itps' => 1,
                'total_itps_open' => $updated['done'] == 0 ? 1 : 0,
                'last_update_mode' => 'Event',
                'date_modified' => $updated['date_modified']
            );

            StatisticsAllController::updateStats($centre_id, $updatePayload);
            StatisticsChildController::updateStats($updated['child_id'], $updatePayload); 
            StatisticsEducatorController::updateStats($updated['educator_id'], $updatePayload); 
        }
    }
}