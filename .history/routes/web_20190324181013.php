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
    $router->get('educator/all/{ids}',  ['uses' => 'EducatorController@getAllByIds']); 
    $router->post('educator', ['uses' => 'EducatorController@create']);  
    $router->delete('educator/{id}', ['uses' => 'EducatorController@delete']);  
    $router->put('educator/{id}', ['uses' => 'EducatorController@update']);

    // Educator Assignment routes
    $router->get('educatorassignment/byChild/{id}',  ['uses' => 'EducatorAssignmentController@getByChild']);
    $router->get('educatorassignment/byChild/{id}/educators',  ['uses' => 'EducatorAssignmentController@getEducatorsByChild']);
    $router->get('educatorassignment/byEducator/{id}',  ['uses' => 'EducatorAssignmentController@getByEducator']); 
    $router->post('educatorassignment/byEducator/{id}', ['uses' => 'EducatorAssignmentController@setByEducator']);
    $router->delete('educatorassignment/byEducator/{id}', ['uses' => 'EducatorAssignmentController@deleteByEducator']);
    $router->delete('educatorassignment/byChild/{id}', ['uses' => 'EducatorAssignmentController@deleteByChild']);

    // Feedback routes
    $router->get('feedback',  ['uses' => 'FeedbackController@getAll']); 
    $router->get('feedback/{id}', ['uses' => 'FeedbackController@get']);  
    $router->post('feedback', ['uses' => 'FeedbackController@create']);  
    $router->delete('feedback/{id}', ['uses' => 'FeedbackController@delete']);  
    $router->put('feedback/{id}', ['uses' => 'FeedbackController@update']);

    // Milestone routes $router->get('educatorassignment/byChild/{id}',  ['uses' => 'EducatorAssignmentController@getByChild']);
    $router->get('milestone/byChild/{id}',  ['uses' => 'MilestoneController@getByChild']);
    $router->post('milestone/byChild/{id}', ['uses' => 'MilestoneController@setByChild']);

    // Observation routes
    $router->get('observation',  ['uses' => 'ObservationController@getAll']); 
    $router->get('observation/{id}', ['uses' => 'ObservationController@get']);  
    $router->post('observation', ['uses' => 'ObservationController@create']);  
    $router->delete('observation/{id}', ['uses' => 'ObservationController@delete']);  
    $router->put('observation/{id}', ['uses' => 'ObservationController@update']);
    $router->post('observation/classify', ['uses' => 'ObservationController@Classify']);  

    // Parent Guardian routes
    $router->get('parentGuardian',  ['uses' => 'ParentGuardianController@getAll']); 
    $router->get('parentGuardian/{id}', ['uses' => 'ParentGuardianController@get']);  
    $router->get('parentGuardian/all/{ids}',  ['uses' => 'ParentGuardianController@getAllByIds']); 
    $router->post('parentGuardian', ['uses' => 'ParentGuardianController@create']);  
    $router->delete('parentGuardian/{id}', ['uses' => 'ParentGuardianController@delete']);  
    $router->put('parentGuardian/{id}', ['uses' => 'ParentGuardianController@update']);

    // Parent Guardian Assignment routes
    $router->get('parentGuardianAssignment/byChild/{id}',  ['uses' => 'ParentGuardianAssignmentController@getByChild']);
    $router->get('parentGuardianAssignment/byChild/{id}/parentsGuardians',  ['uses' => 'ParentGuardianAssignmentController@getParentsGuardiansByChild']);
    $router->get('parentGuardianAssignment/byParentGuardian/{id}',  ['uses' => 'ParentGuardianAssignmentController@getByParentGuardian']); 
    $router->post('parentGuardianAssignment/byParentGuardian/{id}', ['uses' => 'ParentGuardianAssignmentController@setByParentGuardian']);
    $router->delete('parentGuardianAssignment/byParentGuardian/{id}', ['uses' => 'ParentGuardianAssignmentController@deleteByParentGuardian']);
    $router->delete('parentGuardianAssignment/byChild/{id}', ['uses' => 'ParentGuardianAssignmentController@deleteByChild']);

    // Teaching Plan routes
    $router->get('teachingPlan',  ['uses' => 'TeachingPlanController@getAll']); 
    $router->get('teachingPlan/{id}', ['uses' => 'TeachingPlanController@get']);  
    $router->post('teachingPlan', ['uses' => 'TeachingPlanController@create']);  
    $router->delete('teachingPlan/{id}', ['uses' => 'TeachingPlanController@delete']);  
    $router->put('teachingPlan/{id}', ['uses' => 'TeachingPlanController@update']);
  });