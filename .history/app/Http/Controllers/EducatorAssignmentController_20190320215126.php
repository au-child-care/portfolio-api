<?php

namespace App\Http\Controllers;

use DB;
use App\Models\EducatorAssignment;
use Illuminate\Http\Request;

class EducatorAssignmentController extends Controller
{
    public function getByChild($id) {
        return response()->json(
            EducatorAssignment::where(['child_id' => $id])
                ->get());
    }

    public function getEducatorsByChild($id) {
        $ids = array_column(EducatorAssignment::where(['child_id' => $id])->get(), 'educator_id');
        return response()->json($ids);
    }

    public function getByEducator($id) {
        return response()->json(
            EducatorAssignment::where(['educator_id' => $id])
                ->get());
    }

    public function setByEducator(Request $request) {
        EducatorAssignment::where(['educator_id' => (int)$request['id']])->delete();
        foreach ($request->all() as $current) {
            EducatorAssignment::create($current);
        }
        return response()->json('Educator - children assignment was successfully set.', 200);
    }

    public function deleteByEducator($id) {
        EducatorAssignment::where(['educator_id' => $id])->delete();
        return response()->json('Educator - children assignment was successfully removed.', 200);
    }
}