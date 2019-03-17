<?php

namespace App\Http\Controllers;

use App\Models\Educator;
use Illuminate\Http\Request;

class EducatorController extends Controller
{
    public function getAll(Request $request) {
        $active = $request['active'] ?? 1;
        $deleted = $request['deleted'] ?? 0;
        return response()->json(
            Educator::where(['active' => (int)$active, 'deleted' => (int)$deleted])
                ->get());
    }

    public function get($id) {
        return response()->json(Educator::find($id));
    }

    public function create(Request $request) {
        $this->validateRequest($request);
        $educator = Educator::create($request->all());
        return response()->json($educator, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request);
        $educator = Educator::findOrFail($id);
        $educator->update($request->all());
        return response()->json($educator, 200);
    }

    public function delete($id) {
        Educator::findOrFail($id)->delete();
        return response('Deleted Successfully', 200);
    }

    function validateRequest(Request $request, bool $forCreate = true) {
        $this->validate($request, [
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required|email'
        ]);
        if ($forCreate) {
            $this->validate($request, [
                'email' => 'unique:administrators'
            ]);
        }
    }
}