<?php

namespace App\Http\Controllers;

use DB;
use App\Models\EducatorAssignment;
use Illuminate\Http\Request;

class EducatorAssignmentController extends Controller
{
    public function getByChild($id) {
        return response()->json(
            EducatorAssignment::where(['child_id' => $child_id])
                ->get());
    }
    public function getByEducator($educator_id) {
        return response()->json(
            EducatorAssignment::where(['educator_id' => $child_id])
                ->get());
    }

    public function setByEducator(Request $request) {
        EducatorAssignment::where(['educator_id' => (int)$request['educator_id']])->delete();
        foreach ($request->all() as $current) {
            EducatorAssignment::create($current);
        }
        return response()->json('Educator - childred assignment was successfully set.', 200);
    }
}