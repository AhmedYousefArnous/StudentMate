<?php

use Illuminate\Http\Request;
use App\Http\Resources\Student as StudentResource;
use App\Http\Resources\Structure\University as UniversityResource;
use App\Http\Resources\StudentCollection;


use App\Models\Members\Students\Student;
use App\Models\Structure\University;
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

// Route::get('/student/test', function() {
//   return new StudentResource(Student::find(2));
//
//   // return new StudentCollection(Student::where('id',2)->get());
// });

Route::middleware('api')->prefix('generic')->group(function() {
    Route::get('/', 'API\APIController@index')->name('api.index');
    Route::get('/{id}', 'API\APIController@show')->name('api.show');

});


// Student Routes
// Without Authorization
Route::middleware('api')->prefix('student')->group(function() {
    Route::post('/register', 'API\StudentProfileController@register')->name('api.student.register');


});


// Student Routes
// With Authorization
Route::middleware('auth:student-api')->prefix('student')->group(function() {

    Route::get('/{id}', function($id) {
      return new StudentResource(Student::find($id));
    });
    
    Route::get('/', function() {
      return new StudentResource(Student::find(auth()->user()->id));
    });

    // Route::get('/profile', 'API\StudentProfileController@profile')->name('api.student.profile.private');
});


Route::middleware('auth:student-api')->prefix('conversations')->group(function() {

    Route::get('/', function() {
      return new StudentResource(Student::find(auth()->user()->id));
    });

});
