<?php

namespace App\Http\Controllers;

use App\Models\Administrator;
use Illuminate\Http\Request;

class AdministratorController extends Controller
{

    public function getAll(Request $request)
    {
        $active = (int)$request['active'] ?? 1;
        $deleted = (int)$request['deleted'] ?? 0;
        return response()->json(Administrator::where(['active' => $active, 'deleted' => $deleted])->get());
    }
}