<?php

namespace App\Http\Controllers;

use App\Models\Administrator;
use App\Models\Centre;
use App\Models\Educator;
use App\Models\ParentGuardian;
use Illuminate\Http\Request;

class AccountController extends Controller
{
    public function authenticate(Request $request) {
        $centre_code = $request['centre_code'];
        $email = $request['email'];
        $password = $request['password'];
        $role =  $request['role'];
        $records = array();

        $centres = Centre::where(['centre_code' => $centre_code])->get()->toArray();

        if ($centres && sizeof($centres) > 0) {

            $centre = $centres[0];

            if ($centre['active'] == 0) {
                return response()->json(array(
                    'success' => false,
                    'message' => 'Centre is inactive. Please contact an administrator.'
                ), 401);
            } else {

                if ($role === 'ROLE_ADMIN') {
                    $records = Administrator::where([
                        'centre_id' => $centre['id'],
                        'email' => $email,
                        'deleted' => 0])->get()->toArray();
                } elseif ($role === 'ROLE_EDUCATOR') {
                    $records = Educator::where([
                        'centre_id' => $centre['id'],
                        'email' => $email,
                        'deleted' => 0])->get()->toArray();
                } elseif ($role === 'ROLE_PARENT_GUARDIAN') {
                    $records = ParentGuardian::where([
                        'centre_id' => $centre['id'],
                        'email' => $email,
                        'deleted' => 0])->get()->toArray();
                } else {
                    return response()->json(array(                    
                            'success' => false,
                            'message' => 'Invalid user role provided.'
                        ), 400);
                }

                if ($records && sizeof($records) > 0) {
                    $record = $records[0];
                    if ($record['active'] == 0) {
                        return response()->json(array(
                            'success' => false,
                            'message' => 'Account is inactive. Please contact an administrator.'
                        ), 401);
                    } else {
                        if ($password === $record['password']) {
                            return response()->json(array(
                                'success' => true,
                                'message' => 'Login successful.',
                                'user_details' => array(
                                    'id' => $record['id'],
                                    'first_name' => $record['first_name'],
                                    'last_name' => $record['last_name'],
                                    'nickname' => $record['nickname'],
                                    'email' => $record['email'],
                                    'contact_number' => $record['contact_number'],
                                    'date_modified' => $record['date_modified']
                                ),
                                'centre_details' => array(
                                    'id' => $centre['id'],
                                    'centre_code' => $centre['centre_code'],
                                    'name' => $centre['name'],
                                    'address' => $centre['address'],
                                    'contact_name' => $centre['contact_name'],
                                    'contact_email' => $centre['contact_email'],
                                    'contact_number' => $centre['contact_number'],
                                    'date_modified' => $centre['date_modified']
                                ),
                                'role' => $role), 200);
                        } else {
                            return response()->json(array(
                                'success' => false,
                                'message' => 'Invalid email or password.'
                            ), 401);
                        }
                    }
                } else {
                    return response()->json(array(
                        'success' => false,
                        'message' => 'Invalid email or password.'
                    ), 401);
                }
            }

        } else {
            return response()->json(array(
                'success' => false,
                'message' => 'Centre not found.'
            ), 404);
        }
    }

    public function update($role, Request $request) {
        if ($role === 'ROLE_ADMIN') {
            $adminCtl = new AdministratorController();
            return $adminCtl->update($request['id'], $request);
        } elseif ($role === 'ROLE_EDUCATOR') {
            $educCtl = new EducatorController();
            return $educCtl->update($request['id'], $request);
        } elseif ($role === 'ROLE_PARENT_GUARDIAN') {
            $parentCtl = new ParentGuardianController();
            return $parentCtl->update($request['id'], $request);
        } else {
            return response('Invalid role provided', 400);
        }
    }
}