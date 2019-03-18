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
        $result = EducatorAssignment::wherein('educator_id', array($request['id']))->delete();
        foreach ($request->all() as $current) {
            EducatorAssignment::create($current);
        }
        return response()->json(true, 200);
    }
}