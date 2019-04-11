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

    public function getAllByIds($ids) {
        return response()->json(ParentGuardian::findMany(array_map('intval', explode(',', $ids))));
    }

    public function create(Request $request) {
        $this->validateRequest($request);
        $requestArray = $request->all();
        $parentGuardian = ParentGuardian::create($requestArray);
        $this->updateStats(null, $requestArray);
        return response()->json($parentGuardian, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request, false);
        $parentGuardian = ParentGuardian::findOrFail($id);
        $original = $parentGuardian->toArray();
        $updated = $request->all();
        $parentGuardian->update($updated);
        $this->updateStats($original, $updated);
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
                'email' => 'unique_with:parents_guardians,deleted'
            ]);
        }
    }

    function updateStats($original, $updated) {
        if ($original) {
            StatisticsAllController::updateStats(array(
                'total_parents_guardians' => -1,
                'total_parents' => $original['type'] == 'Parent' ? -1 : 0,
                'total_guardians' => $original['type'] == 'Guardian' ? -1 : 0,
                'last_update_mode' => 'Event',
                'date_modified' => array_key_exists('date_modified', $updated) ? $updated['date_modified'] : date('Y-m-d H:i:s')
            ));
        }

        if (array_key_exists('deleted', $updated) && $updated['deleted'] == 0)
        {
            StatisticsAllController::updateStats(array(
                'total_parents_guardians' => 1,
                'total_parents' => $updated['type'] == 'Parent' ? 1 : 0,
                'total_guardians' => $updated['type'] == 'Guardian' ? 1 : 0,
                'last_update_mode' => 'Event',
                'date_modified' => array_key_exists('date_modified', $updated) ? $updated['date_modified'] : date('Y-m-d H:i:s')
            ));
        }
    }
}