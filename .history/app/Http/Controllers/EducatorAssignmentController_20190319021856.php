<?php

namespace App\Http\Controllers;

use App\Models\EducatorAssignment;
use Illuminate\Http\Request;

class EducatorAssignmentController extends Controller
{
    public function getByChild($id) {
        return response()->json(
            EducatorAssignment::where(['child_id' => $id])
                ->get());
    }
    public function getByEducator($id) {
        return response()->json(
            EducatorAssignment::where(['educator_id' => $id])
                ->get());
    }

    public function setByEducator(Request $request) {
        $this->validateRequest($request);
        $educatorAssignment = EducatorAssignment::create($request->all());
        return response()->json($educatorAssignment, 200);
    }

    function validateRequest(Request $request) {
        $this->validate($request, [            
            'educator_id' => 'required',
            'child_id' => 'required'
        ]);
    }
}