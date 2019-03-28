<?php

namespace App\Http\Controllers;

use DB;
use App\Models\StatisticsEducator;
use Illuminate\Http\Request;

class StatisticsEducatorController extends Controller
{
    public function get($educator_id) {
        return response()->json(StatisticsEducatorController::getRecord($educator_id));
    }

    public function update($educator_id, Request $request) {
        $updatedRecord = StatisticsEducatorController::updateStats($educator_id, $request->all());
        return response()->json($updatedRecord, 200);
    }

    static function getRecord($educator_id) {
        $record = StatisticsEducator::find($educator_id);
        if (!$record) {
            StatisticsEducator::create([
                    'educator_id' => $educator_id,
                    'last_update_mode'=> 'Event',
                    'date_modified'=> date('Y-m-d H:i:s'),
                ]);
            $record = StatisticsEducator::find($educator_id);
        }
        return $record;
    }

    public static function updateStats($educator_id, $request) {
        $record = StatisticsEducatorController::getRecord($educator_id);
        foreach(array_keys($request) as $key) {
            if ($key == 'last_update_mode' || $key == 'date_modified') {
                $record[$key] = $request[$key];
            } else if ($key != 'educator_id') {
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