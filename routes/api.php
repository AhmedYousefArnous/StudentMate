<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::middleware('api')->prefix('generic')->group(function() {
    Route::get('/', 'API\APIController@index')->name('api.index');
    Route::get('/{id}', 'API\APIController@show')->name('api.show');
});


Route::middleware('api')->prefix('student')->group(function() {
    Route::post('/register', 'API\StudentProfileController@register')->name('api.student.register');
});


Route::middleware('auth:student-api')->prefix('student')->group(function() {
    Route::get('/profile', 'API\StudentProfileController@profile')->name('api.student.profile.private');
    

});
    
