<?php

namespace App\Http\Controllers;

use App\Models\Notification;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    public function getAll(Request $request) {
        $deleted = $request['deleted'] ?? 0;
        return response()->json(
            Notification::where(['deleted' => $deleted])
                ->orderBy('date_created', 'desc')
                ->get());
    }

    public function getAllForRecipient(Request $request) {
        $recipient_id = $request['recipient_id'] ?? 0;
        $recipient_role = $request['recipient_role'] ?? '';
        return response()->json(
            Notification::where([
                'recipient_id' => $recipient_id,
                'recipient_role' => $recipient_role,
                'deleted' => 0
                ])
                ->orderBy('date_created', 'desc')
                ->get());
    }

    public function get($id) {
        return response()->json(Notification::find($id));
    }

    public function create(Request $request) {
        $this->validateRequest($request);
        $Notification = Notification::create($request->all());
        return response()->json($Notification, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request);
        $Notification = Notification::findOrFail($id);
        $Notification->update($request->all());
        return response()->json($Notification, 200);
    }

    public function updateMultiple(Request $request) {        
        foreach ($request->all() as $current) {
            $Notification = Notification::findOrFail($current['id']);
            $Notification->update($current);
        }
        return response()->json('Notifications were successfully updated.', 200);
    }

    public function delete($id) {
        Notification::findOrFail($id)->delete();
        return response('Deleted Successfully', 200);
    }

    function validateRequest(Request $request) {
        $this->validate($request, [
            'child_id' => 'required',
            'notification_for' => 'required',
            'target_id' => 'required'
        ]);
    }

    public static function createNotification($notificationDetails) {
        $Notification = Notification::create($notificationDetails);
        return $Notification;
    }
}