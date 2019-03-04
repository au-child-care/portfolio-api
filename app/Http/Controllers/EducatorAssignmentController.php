<?php

namespace App\Http\Controllers;

use App\Models\EducatorAssignment;
use Illuminate\Http\Request;

class EducatorAssignmentController extends Controller
{
    public function getAll(Request $request) {
        $active = $request['active'] ?? 1;
        $deleted = $request['deleted'] ?? 0;
        return response()->json(
            EducatorAssignment::where(['active' => (int)$active, 'deleted' => (int)$deleted])
                ->get());
    }

    public function get($id) {
        return response()->json(EducatorAssignment::find($id));
    }

    public function create(Request $request) {
        $this->validateRequest($request);
        $educatorAssignment = EducatorAssignment::create($request->all());
        return response()->json($educatorAssignment, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request);
        $educatorAssignment = EducatorAssignment::findOrFail($id);
        $educatorAssignment->update($request->all());
        return response()->json($educatorAssignment, 200);
    }

    public function delete($id) {
        EducatorAssignment::findOrFail($id)->delete();
        return response('Deleted Successfully', 200);
    }

    function validateRequest(Request $request) {
        $this->validate($request, [
        ]);
    }
}