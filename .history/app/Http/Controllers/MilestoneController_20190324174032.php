<?php

namespace App\Http\Controllers;

use App\Models\Milestone;
use Illuminate\Http\Request;

class MilestoneController extends Controller
{
    public function getByChild($id) {
        return response()->json(
            Milestone::where(['child_id' => $id])
                ->get());
    }

    public function setByChild(Request $request) {
        Milestone::where(['child_id' => (int)$request['id']])->delete();
        foreach ($request->all() as $current) {
            Milestone::create($current);
        }
        return response()->json('Milestones were successfully set.', 200);
    }
}