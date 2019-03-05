<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->group(['prefix' => 'api'], function () use ($router) {
    // Administrator routes
    $router->get('administrator',  ['uses' => 'AdministratorController@getAll']); 
    $router->get('administrator/{id}', ['uses' => 'AdministratorController@get']);  
    $router->post('administrator', ['uses' => 'AdministratorController@create']);  
    $router->delete('administrator/{id}', ['uses' => 'AdministratorController@delete']);  
    $router->put('administrator/{id}', ['uses' => 'AdministratorController@update']);

    // Child routes
    $router->get('child',  ['uses' => 'ChildController@getAll']); 
    $router->get('child/{id}', ['uses' => 'ChildController@get']);  
    $router->post('child', ['uses' => 'ChildController@create']);  
    $router->delete('child/{id}', ['uses' => 'ChildController@delete']);  
    $router->put('child/{id}', ['uses' => 'ChildController@update']);

    // Educator routes
    $router->get('educator',  ['uses' => 'EducatorController@getAll']); 
    $router->get('educator/{id}', ['uses' => 'EducatorController@get']);  
    $router->post('educator', ['uses' => 'EducatorController@create']);  
    $router->delete('educator/{id}', ['uses' => 'EducatorController@delete']);  
    $router->put('educator/{id}', ['uses' => 'EducatorController@update']);

    // Educator Assignment routes
    $router->get('educatorassignment',  ['uses' => 'EducatorAssignmentController@getAll']); 
    $router->get('educatorassignment/{id}', ['uses' => 'EducatorAssignmentController@get']);  
    $router->post('educatorassignment', ['uses' => 'EducatorAssignmentController@create']);  
    $router->delete('educatorassignment/{id}', ['uses' => 'EducatorAssignmentController@delete']);  
    $router->put('educatorassignment/{id}', ['uses' => 'EducatorAssignmentController@update']);

    // Feedback routes
    $router->get('feedback',  ['uses' => 'FeedbackController@getAll']); 
    $router->get('feedback/{id}', ['uses' => 'FeedbackController@get']);  
    $router->post('feedback', ['uses' => 'FeedbackController@create']);  
    $router->delete('feedback/{id}', ['uses' => 'FeedbackController@delete']);  
    $router->put('feedback/{id}', ['uses' => 'FeedbackController@update']);

    // Milestone routes
    $router->get('milestone',  ['uses' => 'MilestoneController@getAll']); 
    $router->get('milestone/{id}', ['uses' => 'MilestoneController@get']);  
    $router->post('milestone', ['uses' => 'MilestoneController@create']);  
    $router->delete('milestone/{id}', ['uses' => 'MilestoneController@delete']);  
    $router->put('milestone/{id}', ['uses' => 'MilestoneController@update']);

    // Observation routes
    $router->get('observation',  ['uses' => 'ObservationController@getAll']); 
    $router->get('observation/{id}', ['uses' => 'ObservationController@get']);  
    $router->post('observation', ['uses' => 'ObservationController@create']);  
    $router->delete('observation/{id}', ['uses' => 'ObservationController@delete']);  
    $router->put('observation/{id}', ['uses' => 'ObservationController@update']);

    // Parent Guardian routes
    $router->get('parentGuardian',  ['uses' => 'ParentGuardianController@getAll']); 
    $router->get('parentGuardian/{id}', ['uses' => 'ParentGuardianController@get']);  
    $router->post('parentGuardian', ['uses' => 'ParentGuardianController@create']);  
    $router->delete('parentGuardian/{id}', ['uses' => 'ParentGuardianController@delete']);  
    $router->put('parentGuardian/{id}', ['uses' => 'ParentGuardianController@update']);

    // Parent Guardian Assignment routes
    $router->get('parentGuardianAssignment',  ['uses' => 'ParentGuardianAssignmentController@getAll']); 
    $router->get('parentGuardianAssignment/{id}', ['uses' => 'ParentGuardianAssignmentController@get']);  
    $router->post('parentGuardianAssignment', ['uses' => 'ParentGuardianAssignmentController@create']);  
    $router->delete('parentGuardianAssignment/{id}', ['uses' => 'ParentGuardianAssignmentController@delete']);  
    $router->put('parentGuardianAssignment/{id}', ['uses' => 'ParentGuardianAssignmentController@update']);

    // Teaching Plan routes
    $router->get('teachingPlan',  ['uses' => 'TeachingPlanController@getAll']); 
    $router->get('teachingPlan/{id}', ['uses' => 'TeachingPlanController@get']);  
    $router->post('teachingPlan', ['uses' => 'TeachingPlanController@create']);  
    $router->delete('teachingPlan/{id}', ['uses' => 'TeachingPlanController@delete']);  
    $router->put('teachingPlan/{id}', ['uses' => 'TeachingPlanController@update']);
  });