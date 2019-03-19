<?php

namespace App\Http\Controllers;

use App\Models\ParentGuardianAssignment;
use Illuminate\Http\Request;

class ParentGuardianAssignmentController extends Controller
{
    public function getAll(Request $request) {
        $active = $request['active'] ?? 1;
        $deleted = $request['deleted'] ?? 0;
        return response()->json(
            ParentGuardianAssignment::where(['active' => (int)$active, 'deleted' => (int)$deleted])
                ->get());
    }

    public function get($id) {
        return response()->json(ParentGuardianAssignment::find($id));
    }

    public function create(Request $request) {
        $this->validateRequest($request);
        $parentGuardianAssignment = ParentGuardianAssignment::create($request->all());
        return response()->json($parentGuardianAssignment, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request);
        $parentGuardianAssignment = ParentGuardianAssignment::findOrFail($id);
        $parentGuardianAssignment->update($request->all());
        return response()->json($parentGuardianAssignment, 200);
    }

    public function delete($id) {
        ParentGuardianAssignment::findOrFail($id)->delete();
        return response('Deleted Successfully', 200);
    }

    function validateRequest(Request $request) {
        $this->validate($request, [
            'parentguardian_id' => 'required',
            'child_id' => 'required'
        ]);
    }
}