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
  });