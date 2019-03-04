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
  });