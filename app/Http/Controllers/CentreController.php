<?php

namespace App\Http\Controllers;

use App\Models\Centre;
use Illuminate\Http\Request;

class CentreController extends Controller
{
    public function getAll(Request $request) {
        $active = $request['active'] ?? 1;
        return response()->json(
            Centre::where([
                    'active' => (int)$active
                ])
                ->orderBy('centre_code', 'asc')
                ->get());
    }

    public function get($id) {
        return response()->json(Centre::find($id));
    }

    public function create(Centre $request) {
        $this->validateRequest($request);
        $centre = Centre::create($request->all());
        return response()->json($centre, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request, false);
        $centre = Centre::findOrFail($id);
        $centre->update($request->all());
        return response()->json($centre, 200);
    }

    public function delete($id) {
        Centre::findOrFail($id)->delete();
        return response('Deleted Successfully', 200);
    }

    function validateRequest(Request $request, bool $forCreate = true) {
        $this->validate($request, [
            'centre_code' => 'required',
            'name' => 'required'
        ]);
        if ($forCreate) {
            $this->validate($request, [
                'centre_code' => 'unique:centres'
            ]);
        } else {
            $this->validate($request, [
                'centre_code' => 'unique:centres,centre_code,'.$request['id']
            ]);
        }
    }
}