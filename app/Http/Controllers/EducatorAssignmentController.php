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
        $encodedResult  = json_encode(EducatorAssignment::where(['child_id' => $id])->get());
        $arrayResult = json_decode($encodedResult, true);
        $ids = array_column($arrayResult, 'educator_id');
        $educatorController = new EducatorController();
        return $educatorController->getAllByIds(implode(',',$ids));
    }

    public function getByEducator($id) {
        return response()->json(
            EducatorAssignment::where(['educator_id' => $id])
                ->get());
    }

    public function getChildrenByEducator($id) {
        $encodedResult  = json_encode(EducatorAssignment::where(['educator_id' => $id])->get());
        $arrayResult = json_decode($encodedResult, true);
        $ids = array_column($arrayResult, 'child_id');
        $childController = new ChildController();
        return $childController->getAllByIds(implode(',',$ids));
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

    public function deleteByChild($id) {
        EducatorAssignment::where(['child_id' => $id])->delete();
        return response()->json('Educator - children assignment was successfully removed.', 200);
    }

    public static function getEducatorIdsByChild($child_id) {
        $encodedResult  = json_encode(EducatorAssignment::where(['child_id' => $child_id])->get());
        $arrayResult = json_decode($encodedResult, true);
        $ids = array_column($arrayResult, 'educator_id');
        return $ids;
    }
}