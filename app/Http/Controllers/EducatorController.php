<?php

namespace App\Http\Controllers;

use App\Models\Educator;
use Illuminate\Http\Request;

class EducatorController extends Controller
{
    public function getAll(Request $request) {
        $deleted = $request['deleted'] ?? 0;
        return response()->json(
            Educator::where(['deleted' => (int)$deleted])
                ->get());
    }

    public function get($id) {
        return response()->json(Educator::find($id));
    }

    public function getAllByIds($ids) {
        return response()->json(Educator::findMany(array_map('intval', explode(',', $ids))));
    }

    public function create(Request $request) {
        $this->validateRequest($request);
        $requestArray = $request->all();
        $educator = Educator::create($requestArray);
        $this->updateStats(null, $requestArray);
        return response()->json($educator, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request, false);
        $educator = Educator::findOrFail($id);
        $original = $educator->toArray();
        $updated = $request->all();
        $educator->update($updated);
        $this->updateStats($original, $updated);
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
                'email' => 'unique_with:educators,deleted'
            ]);
        }
    }

    function updateStats($original, $updated) {
        if ($original) {
            StatisticsAllController::updateStats(array(
                'total_educators' => -1,
                'last_update_mode' => 'Event',
                'date_modified' => array_key_exists('date_modified', $updated) ? $updated['date_modified'] : date('Y-m-d H:i:s')
            ));
        }

        if (array_key_exists('deleted', $updated) && $updated['deleted'] == 0)
        {
            StatisticsAllController::updateStats(array(
                'total_educators' => 1,
                'last_update_mode' => 'Event',
                'date_modified' => array_key_exists('date_modified', $updated) ? $updated['date_modified'] : date('Y-m-d H:i:s')
            ));
        }
    }
}
