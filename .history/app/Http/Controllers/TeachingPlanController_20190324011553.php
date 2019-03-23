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
        $teachingPlan = TeachingPlan::create($request->all());
        return response()->json($teachingPlan, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request);
        $teachingPlan = TeachingPlan::findOrFail($id);
        $teachingPlan->update($request->all());
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
            'title' => 'title',
            'details' => 'required',
            'target_outcome_id' => 'required',
            'target_date' => 'required'
        ]);
    }
}