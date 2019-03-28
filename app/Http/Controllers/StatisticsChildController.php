<?php

namespace App\Http\Controllers;

use DB;
use App\Models\StatisticsChild;
use Illuminate\Http\Request;

class StatisticsChildController extends Controller
{
    public function get($child_id) {
        return response()->json(StatisticsChildController::getRecord($child_id));
    }

    public function update($child_id, Request $request) {
        $updatedRecord = StatisticsChildController::updateStats($child_id, $request->all());
        return response()->json($updatedRecord, 200);
    }

    static function getRecord($child_id) {
        $record = StatisticsChild::find($child_id);
        if (!$record) {
            StatisticsChild::create([
                    'child_id' => $child_id,
                    'last_update_mode'=> 'Event',
                    'date_modified'=> date('Y-m-d H:i:s'),
                ]);
            $record = StatisticsChild::find($child_id);
        }
        return $record;
    }

    public static function updateStats($child_id, $request) {
        $record = StatisticsChildController::getRecord($child_id);
        foreach(array_keys($request) as $key) {
            if ($key == 'last_update_mode' || $key == 'date_modified') {
                $record[$key] = $request[$key];
            } else if ($key != 'child_id') {
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