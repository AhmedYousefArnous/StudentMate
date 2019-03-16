<?php

use Illuminate\Http\Request;
// Members
use App\Http\Resources\Student as StudentResource;
use App\Http\Resources\StudentFull as StudentFullResource;

// Structure
use App\Http\Resources\Structure\University as UniversityResource;

// Materials
use App\Http\Resources\Materials\Series as SeriesResource;
use App\Http\Resources\Materials\SeriesFull as SeriesFullResource;



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


// Route::middleware('api')->prefix('generic')->group(function() {
//     Route::get('/', 'API\APIController@index')->name('api.index');
//     Route::get('/{id}', 'API\APIController@show')->name('api.show');
//
// });


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
    return new StudentFullResource(Student::find(auth()->user()->id));
  });



    // Route::get('/profile', 'API\StudentProfileController@profile')->name('api.student.profile.private');
});

Route::middleware('auth:student-api')->prefix('series')->group(function() {
    Route::get('/{id}', function() {
      return SeriesFullResource::collection(Student::find(auth()->user()->id)->Series);
    });

    Route::get('/', function() {
      return SeriesResource::collection(Student::find(auth()->user()->id)->Series);
    });

});

// Route::middleware('auth:student-api')->prefix('conversations')->group(function() {
//     Route::get('/', function() {
//       return new StudentResource(Student::find(auth()->user()->id));
//     });
// });
