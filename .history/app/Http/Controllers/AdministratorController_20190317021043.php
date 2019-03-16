<?php

namespace App\Http\Controllers;

use App\Models\Administrator;
use Illuminate\Http\Request;

class AdministratorController extends Controller
{
    public function getAll(Request $request) {
        $deleted = $request['deleted'] ?? 0;
        return response()->json(
            Administrator::where(['deleted' => (int)$deleted])
                ->get());
    }

    public function get($id) {
        return response()->json(Administrator::find($id));
    }

    public function create(Request $request) {
        $this->validateRequest($request, true);
        $administrator = Administrator::create($request->all());
        return response()->json($administrator, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request, false);
        $administrator = Administrator::findOrFail($id);
        $administrator->update($request->all());
        return response()->json($administrator, 200);
    }

    public function delete($id) {
        Administrator::findOrFail($id)->delete();
        return response('Deleted Successfully', 200);
    }

    function validateRequest(Request $request, forCreate) {
        $this->validate($request, [
            'first_name' => 'required',
            'last_name' => 'required'
        ]);
        if (forCreate) {
            $this->validate($request, [
                'email' => 'required|email|unique:administrators'
            ]);
        }
    }
}