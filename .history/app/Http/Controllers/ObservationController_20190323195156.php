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
                ->get()
                ->sortByDesc('date_tracked'));
    }

    public function get($id) {
        return response()->json(Observation::find($id));
    }

    public function create(Request $request) {
        $this->validateRequest($request);
        $observation = Observation::create($request->all());
        return response()->json($observation, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request);
        $observation = Observation::findOrFail($id);
        $observation->update($request->all());
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
}