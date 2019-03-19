<?php

namespace App\Http\Controllers;

use App\Models\ParentGuardianAssignment;
use Illuminate\Http\Request;

class ParentGuardianAssignmentController extends Controller
{
    public function getByChild($id) {
        return response()->json(
            ParentGuardianAssignment::where(['child_id' => $id])
                ->get());
    }
    public function getByParentGuardian($id) {
        return response()->json(
            ParentGuardianAssignment::where(['parentguardian_id' => $id])
                ->get());
    }

    public function setByParentGuardian(Request $request) {
        ParentGuardianAssignment::where(['parentguardian_id' => (int)$request['id']])->delete();
        foreach ($request->all() as $current) {
            ParentGuardianAssignment::create($current);
        }
        return response()->json('Parent / guardian - children assignment was successfully set.', 200);
    }

    public function deleteByParentGuardian($id) {
        ParentGuardianAssignment::where(['parentguardian_id' => $id])->delete();
        return response()->json('Parent / guardian - children assignment was successfully removed.', 200);
    }
}