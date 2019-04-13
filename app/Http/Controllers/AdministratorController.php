<?php

namespace App\Http\Controllers;

use App\Models\Administrator;
use App\Utilities\PasswordUtilities;
use Illuminate\Http\Request;

class AdministratorController extends Controller
{
    public function getAll(Request $request) {
        $deleted = $request['deleted'] ?? 0;
        $centre_id = $request['centre_id'] ?? 0;
        return response()->json(
            Administrator::where([
                    'deleted' => (int)$deleted,
                    'centre_id' => (int)$centre_id
                ])
                ->orderBy('first_name', 'asc')
                ->get());
    }

    public function get($id) {
        return response()->json(Administrator::find($id));
    }

    public function create(Request $request) {
        $this->validateRequest($request);
        $administrator = Administrator::create(PasswordUtilities::preparePasswordField($request->all()));
        return response()->json($administrator, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request, false);
        $administrator = Administrator::findOrFail($id);
        $administrator->update(PasswordUtilities::preparePasswordField($request->all()));
        return response()->json($administrator, 200);
    }

    public function delete($id) {
        Administrator::findOrFail($id)->delete();
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
                'centre_id' => 'required',
                'email' => 'unique_with:administrators,centre_id,deleted'
            ], [
                'unique_with' => ':attribute already exists.'
            ]);
        }
    }
}