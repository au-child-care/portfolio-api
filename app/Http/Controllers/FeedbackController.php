<?php

namespace App\Http\Controllers;

use App\Models\Child;
use App\Models\Feedback;
use Illuminate\Http\Request;

class FeedbackController extends Controller
{
    public function getAll(Request $request) {
        $active = $request['active'] ?? 1;
        $deleted = $request['deleted'] ?? 0;
        return response()->json(
            Feedback::where(['deleted' => (int)$deleted])
                ->orderBy('date_created', 'desc')
                ->get());
    }

    public function getAllForChild($id) {
        return response()->json(
            Feedback::where(['child_id' => $id, 'deleted' => 0])
                ->orderBy('date_created', 'desc')
                ->get());
    }

    public function get($id) {
        return response()->json(Feedback::find($id));
    }

    public function create(Request $request) {
        $this->validateRequest($request);
        $feedback = Feedback::create($request->all());
        $this->createNotifications($feedback);
        return response()->json($feedback, 201);
    }

    public function update($id, Request $request) {
        $this->validateRequest($request);
        $feedback = Feedback::findOrFail($id);
        $feedback->update($request->all());
        return response()->json($feedback, 200);
    }

    public function delete($id) {
        Feedback::findOrFail($id)->delete();
        return response('Deleted Successfully', 200);
    }

    function validateRequest(Request $request) {
        $this->validate($request, [
            'child_id' => 'required',
            'feedback' => 'required'
        ]);
    }

    function createNotifications(Feedback $feedback) {
        $child = Child::find($feedback['child_id']);
        if ($feedback['giver_role'] == 'Administrator' || $feedback['giver_role'] == 'Educator') {
            $parentGuardianIds = ParentGuardianAssignmentController::getParentGuardianIdsByChild($feedback['child_id']);
            foreach ($parentGuardianIds as $id) {
                $this->createNotification($feedback, $child, $id, 'Parent / Guardian');
            }
        }
        if ($feedback['giver_role'] == 'Administrator' || $feedback['giver_role'] == 'Parent / Guardian') {
            $educatorIds = EducatorAssignmentController::getEducatorIdsByChild($feedback['child_id']);
            foreach ($educatorIds as $id) {
                $this->createNotification($feedback, $child, $id, 'Educator');
            }
        }
    }

    function createNotification(Feedback $feedback, Child $child, $recipientId, $recipientRole) {        
        NotificationController::createNotification(array(
            'notification_for' => 'Feedback',
            'target_id' => $feedback['child_id'],
            'child_id' => $feedback['child_id'],
            'child_name' => $child['first_name'],
            'giver_id' => $feedback['giver_id'],
            'giver_role' => $feedback['giver_role'],
            'giver_name' => $feedback['giver_name'],
            'recipient_id' => $recipientId,
            'recipient_role' => $recipientRole,
            'marked_read' => 0,
            'deleted' => 0,
            'date_created' => $feedback['date_created'],
            'date_modified' => $feedback['date_created']
        ));
    }
}