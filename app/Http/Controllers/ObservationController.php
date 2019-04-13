<?php

namespace App\Http\Controllers;

use App\Models\Observation;
use App\Services\ObservationClassifier;
use Illuminate\Http\Request;

class ObservationController extends Controller
{
    public function getAll(Request $request) {
        $deleted = $request['deleted'] ?? 0;
        return response()->json(
            Observation::where(['deleted' => (int)$deleted])
                ->orderBy('date_tracked', 'desc')
                ->get());
    }
    
    public function getAllByChildIds($ids) {
        return response()->json(
            Observation::wherein('child_id', array_map('intval', explode(',', $ids)))
                ->where(['deleted' => 0])
                ->orderBy('date_tracked', 'desc')
                ->get());
    }
    
    public function getAllByEducatorId($id) {
        return response()->json(
            Observation::where([
                    'deleted' => 0,
                    'educator_id' => $id
                ])
                ->orderBy('date_tracked', 'desc')
                ->get());
    }

    public function get($id) {
        return response()->json(Observation::find($id));
    }

    public function create(Request $request) {
        $this->validateRequest($request);
        $requestArray = $request->all();
        $observation = Observation::create($requestArray);
        $this->updateStats(null, $requestArray);
        return response()->json($observation, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request);
        $observation = Observation::findOrFail($id);
        $original = $observation->toArray();
        $updated = $request->all();
        $observation->update($updated);
        $this->updateStats($original, $updated);
        return response()->json($observation, 200);
    }

    public function delete($id) {
        Observation::findOrFail($id)->delete();
        return response('Deleted Successfully', 200);
    }

    public function classify(Request $request) {
        $classifier = new ObservationClassifier();
        $recommendation = $classifier->Classify($request['observation']);
        return response()->json($recommendation, 200);
    }

    function validateRequest(Request $request) {
        $this->validate($request, [
            'educator_id' => 'required',
            'child_id' => 'required',
            'observation' => 'required',
            'outcome_id' => 'required',
            'date_tracked' => 'required'
        ]);
    }

    function updateStats($original, $updated) {
        if ($original) {
            $updatePayload = array(
                'total_observations' => -1,
                'last_update_mode' => 'Event',
                'date_modified' => $updated['date_modified']
            );

            StatisticsAllController::updateStats($updatePayload);

            $updatePayload['total_observations_outcome1'] = $original['outcome_id'] == '1' ? -1 : 0;
            $updatePayload['total_observations_outcome2'] = $original['outcome_id'] == '2' ? -1 : 0;
            $updatePayload['total_observations_outcome3'] = $original['outcome_id'] == '3' ? -1 : 0;
            $updatePayload['total_observations_outcome4'] = $original['outcome_id'] == '4' ? -1 : 0;
            $updatePayload['total_observations_outcome5'] = $original['outcome_id'] == '5' ? -1 : 0;

            if ($original['published'] == 1) {
                StatisticsChildController::updateStats($original['child_id'], $updatePayload); 
            }
            
            $updatePayload['total_observations_unpublished'] = -1;
            StatisticsEducatorController::updateStats($original['educator_id'], $updatePayload); 
        }

        if ($updated['deleted'] == 0) {
            $updatePayload = array(
                'total_observations' => 1,
                'last_update_mode' => 'Event',
                'date_modified' => $updated['date_modified']
            );

            StatisticsAllController::updateStats($updatePayload);

            $updatePayload['total_observations_outcome1'] = $updated['outcome_id'] == '1' ? 1 : 0;
            $updatePayload['total_observations_outcome2'] = $updated['outcome_id'] == '2' ? 1 : 0;
            $updatePayload['total_observations_outcome3'] = $updated['outcome_id'] == '3' ? 1 : 0;
            $updatePayload['total_observations_outcome4'] = $updated['outcome_id'] == '4' ? 1 : 0;
            $updatePayload['total_observations_outcome5'] = $updated['outcome_id'] == '5' ? 1 : 0;

            if ($updated['published'] == 1) {
                StatisticsChildController::updateStats($updated['child_id'], $updatePayload);
            }

            $updatePayload['total_observations_unpublished'] = $updated['published'] == 0 ? 1 : 0;
            StatisticsEducatorController::updateStats($updated['educator_id'], $updatePayload); 
        }
    }
}