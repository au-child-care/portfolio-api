<?php

namespace App\Http\Controllers;

use DB;
use App\Models\StatisticsAll;
use Illuminate\Http\Request;

class StatisticsAllController extends Controller
{
    public function get() {
        return response()->json(StatisticsAllController::getRecord());
    }

    public function update(Request $request) {
        $updatedRecord = StatisticsAllController::updateStats($request->all());
        return response()->json($updatedRecord, 200);
    }

    static function getRecord() {
        $record = StatisticsAll::first();
        if (!$record) {
            StatisticsAll::create();
            $record = StatisticsAll::first();
        }
        return $record;
    }

    public static function updateStats($request) {
        $record = StatisticsAllController::getRecord();
        foreach(array_keys($request) as $key) {
            if ($key === 'last_update_mode' || $key === 'date_modified') {
                $record[$key] = $request[$key];
            } else if ($key !== 'id') {
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