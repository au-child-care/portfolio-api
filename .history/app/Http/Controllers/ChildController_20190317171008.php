<?php

namespace App\Http\Controllers;

use App\Models\Child;
use Illuminate\Http\Request;

class ChildController extends Controller
{
    public function getAll(Request $request) {
        $deleted = $request['deleted'] ?? 0;
        return response()->json(
            Child::where(['deleted' => (int)$deleted])
                ->get());
    }

    public function get($id) {
        return response()->json(Child::find($id));
    }

    public function create(Request $request) {
        $this->validateRequest($request);
        $child = Child::create($request->all());
        return response()->json($child, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request);
        $child = Child::findOrFail($id);
        $child->update($request->all());
        return response()->json($child, 200);
    }

    public function delete($id) {
        Child::findOrFail($id)->delete();
        return response('Deleted Successfully', 200);
    }

    function validateRequest(Request $request) {
        $this->validate($request, [
            'first_name' => 'required',
            'last_name' => 'required',
            'birthday' => 'required',
            'level' => 'required'
        ]);
    }
}