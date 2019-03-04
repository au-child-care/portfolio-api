<?php

namespace App\Http\Controllers;

use App\Models\Feedback;
use Illuminate\Http\Request;

class FeedbackController extends Controller
{
    public function getAll(Request $request) {
        $active = $request['active'] ?? 1;
        $deleted = $request['deleted'] ?? 0;
        return response()->json(
            Feedback::where(['active' => (int)$active, 'deleted' => (int)$deleted])
                ->get());
    }

    public function get($id) {
        return response()->json(Feedback::find($id));
    }

    public function create(Request $request) {
        $this->validateRequest($request);
        $feedback = Feedback::create($request->all());
        return response()->json($feedback, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request);
        $feedback = Feedback::findOrFail($id);
        $feedback->update($request->all());
        return response()->json($feedback, 200);
    }

    public function delete($id) {
        Feedback::findOrFail($id)->delete();
        return response('Deleted Successfully', 200);
    }

    function validateRequest(Request $request) {
        $this->validate($request, [
            'child_id' => 'required',
            'feedback' => 'required'
        ]);
    }
}