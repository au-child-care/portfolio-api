<?php

namespace App\Http\Controllers;

use App\Models\Child;
use Illuminate\Http\Request;

class ChildController extends Controller
{
    public function getAll(Request $request) {
        $deleted = $request['deleted'] ?? 0;
        $centre_id = $request['centre_id'] ?? 0;
        return response()->json(
            Child::where([
                    'deleted' => (int)$deleted,
                    'centre_id' => (int)$centre_id
                ])
                ->orderBy('first_name', 'asc')
                ->get());
    }

    public function get($id) {
        return response()->json(Child::find($id));
    }

    public function getAllByIds($ids) {
        return response()->json(
            Child::findMany(array_map('intval', explode(',', $ids)))
                ->sortBy('first_name')
                ->values()->all());
    }

    public function create(Request $request) {
        $this->validateRequest($request);
        $requestArray = $request->all();
        $child = Child::create($requestArray);
        $this->updateStats($requestArray['centre_id'], null, $requestArray);
        return response()->json($child, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request, false);
        $child = Child::findOrFail($id);
        $original = $child->toArray();
        $updated = $request->all();
        $child->update($updated);
        $this->updateStats($child['centre_id'], $original, $updated);
        return response()->json($child, 200);
    }

    public function delete($id) {
        Child::findOrFail($id)->delete();
        return response('Deleted Successfully', 200);
    }

    function validateRequest(Request $request, bool $forCreate = true) {
        $this->validate($request, [
            'first_name' => 'required',
            'last_name' => 'required',
            'birthday' => 'required',
            'group' => 'required'
        ]);
        if ($forCreate) {
            $this->validate($request, [
                'centre_id' => 'required'
            ]);
        }
    }

    function updateStats($centre_id, $original, $updated) {
        if ($original) {
            StatisticsAllController::updateStats($centre_id, array(
                'total_children' => -1,
                'total_babies' => $original['group'] == 'Babies' ? -1 : 0,
                'total_senior_babies' => $original['group'] == 'Senior Babies' ? -1 : 0,
                'total_toddlers' => $original['group'] == 'Toddlers' ? -1 : 0,
                'total_juniors' => $original['group'] == 'Juniors' ? -1 : 0,
                'total_kinders' => $original['group'] == 'Kinders' ? -1 : 0,
                'last_update_mode' => 'Event',
                'date_modified' => $updated['date_modified']
            ));
        }

        if ($updated['deleted'] == 0)
        {
            StatisticsAllController::updateStats($centre_id, array(
                'total_children' => 1,
                'total_babies' => $updated['group'] == 'Babies' ? 1 : 0,
                'total_senior_babies' => $updated['group'] == 'Senior Babies' ? 1 : 0,
                'total_toddlers' => $updated['group'] == 'Toddlers' ? 1 : 0,
                'total_juniors' => $updated['group'] == 'Juniors' ? 1 : 0,
                'total_kinders' => $updated['group'] == 'Kinders' ? 1 : 0,
                'last_update_mode' => 'Event',
                'date_modified' => $updated['date_modified']
            ));
        }
    }
}