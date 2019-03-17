<?php

namespace App\Http\Controllers;

use App\Models\ParentGuardian;
use Illuminate\Http\Request;

class ParentGuardianController extends Controller
{
    public function getAll(Request $request) {
        $deleted = $request['deleted'] ?? 0;
        return response()->json(
            ParentGuardian::where(['deleted' => (int)$deleted])
                ->get());
    }

    public function get($id) {
        return response()->json(ParentGuardian::find($id));
    }

    public function create(Request $request) {
        $this->validateRequest($request);
        $parentGuardian = ParentGuardian::create($request->all());
        return response()->json($parentGuardian, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request, false);
        $parentGuardian = ParentGuardian::findOrFail($id);
        $parentGuardian->update($request->all());
        return response()->json($parentGuardian, 200);
    }

    public function delete($id) {
        ParentGuardian::findOrFail($id)->delete();
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
                'email' => 'unique:parents_guardians'
            ]);
        }
    }
}