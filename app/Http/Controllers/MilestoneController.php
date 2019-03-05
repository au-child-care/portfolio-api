<?php

namespace App\Http\Controllers;

use App\Models\Milestone;
use Illuminate\Http\Request;

class MilestoneController extends Controller
{
    public function getAll(Request $request) {
        $published = $request['published'] ?? 1;
        $deleted = $request['deleted'] ?? 0;
        return response()->json(
            Milestone::where(['published' => (int)$published, 'deleted' => (int)$deleted])
                ->get());
    }

    public function get($id) {
        return response()->json(Milestone::find($id));
    }

    public function create(Request $request) {
        $this->validateRequest($request);
        $milstone = Milestone::create($request->all());
        return response()->json($milstone, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request);
        $milstone = Milestone::findOrFail($id);
        $milstone->update($request->all());
        return response()->json($milstone, 200);
    }

    public function delete($id) {
        Milestone::findOrFail($id)->delete();
        return response('Deleted Successfully', 200);
    }

    function validateRequest(Request $request) {
        $this->validate($request, [
            'educator_id' => 'required',
            'child_id' => 'required',
            'age_group' => 'required',
            'developmental_area' => 'required',
            'observation' => 'required',
            'outcome_id' => 'required',
            'date_tracked' => 'required'
        ]);
    }
}