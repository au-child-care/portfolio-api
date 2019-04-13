<?php

namespace App\Http\Controllers;

use DB;
use App\Models\StatisticsAll;
use Illuminate\Http\Request;

class StatisticsAllController extends Controller
{
    public function get($centre_id) {
        return response()->json(StatisticsAllController::getRecord($centre_id));
    }

    public function update($centre_id, Request $request) {
        $updatedRecord = StatisticsAllController::updateStats($centre_id, $request->all());
        return response()->json($updatedRecord, 200);
    }

    static function getRecord($centre_id) {
        $record = StatisticsAll::find($centre_id);
        if (!$record) {
            $record = StatisticsAll::create(array('centre_id' => $centre_id));
        }
        return $record;
    }

    public static function updateStats($centre_id, $request) {
        $record = StatisticsAllController::getRecord($centre_id);
        foreach(array_keys($request) as $key) {
            if ($key == 'last_update_mode' || $key == 'date_modified') {
                $record[$key] = $request[$key];
            } else if ($key != 'id') {
                $record[$key] = $record[$key] + $request[$key];
                if ($record[$key] < 0) {
                    $record[$key] = 0;
                }
            }
        }
        $record->save();
        return $record;
    }
}