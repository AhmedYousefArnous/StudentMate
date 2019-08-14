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

use App\Http\Resources\Materials\SeriesVersionFull as SeriesVersionFullResource;


use App\Http\Resources\Materials\LectureFull as LectureFullResource;
use App\Http\Resources\Materials\LectureSection as LectureSectionResource;

use App\Http\Resources\Materials\HandwritingFull as HandwritingFullResource;

use App\Http\Resources\Socialization\Conversation as ConversationResource;
use App\Http\Resources\Socialization\ConversationFull as ConversationFullResource;

// Models
use App\Models\Members\Students\Student;

use App\Models\Structure\University;

use App\Models\Materials\Series;
use App\Models\Materials\SeriesVersion;
use App\Models\Materials\Lecture;
use App\Models\Materials\LectureSection;
use App\Models\Materials\Handwriting;

use App\Models\Members\Students\Socialization\Conversation;

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
// $respose = [
//   'success' => false,
//   'message' => "Not Found"
// ];
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
  Route::get('/', function() {
    return new StudentFullResource(Student::find(auth()->user()->id));
  });
  
  Route::get('/{id}', function($id) {
    return new StudentResource(Student::find($id));
  });

  Route::post('/', 'API\StudentProfileController@updateProfile')->name('api.student.profile.update');

  Route::post('/first', 'API\StudentProfileController@firstProfile')->name('api.student.profile.first.update');

});

Route::middleware('auth:student-api')
            ->get('/first/content', 'API\StudentProfileController@firstProfileContent')
            ->name('api.student.profile.first.update.content');

// Series
Route::middleware('auth:student-api')->prefix('series')->group(function() {
  Route::get('/', function() {
    return SeriesResource::collection(Student::find(auth()->user()->id)->Series);
  }); 
  Route::get('/{id}', function($id) {
    $series = Series::find($id);
    if(!isset($series))
    {
      $respose = [
        'success' => false,
        'message' => "Not Found"
      ];
      return response()->json($respose , 404);
    }
    return new SeriesFullResource($series);
  });

  Route::get('/{id}/{year}', function($id, $year) {
    $series = SeriesVersion::where('year', $year)->firstOrFail();
    if(!isset($series))
    {
      $respose = [
        'success' => false,
        'message' => "Not Found"
      ];
      return response()->json($respose , 404);
    }
    return new SeriesVersionFullResource($series);
  });
});

// Lectures
Route::middleware('auth:student-api')
  ->name('api.lecture')
  ->get('lectures/{lecture_id}', function($lecture_id) {
        $lecture = Lecture::find($lecture_id);
        if(!isset($lecture))
        {
          $respose = [
            'success' => false,
            'message' => "Not Found"
          ];
          return response()->json($respose , 404);
        }
        return new LectureFullResource($lecture);
    }   
  );

// Lectures Sections
Route::middleware('auth:student-api')
  ->name('api.lecture.section')
  ->get('/sections/{section_id}', function($section_id) {
        $section = LectureSection::find($section_id);
        if(!isset($section))
        {
          $respose = [
            'success' => false,
            'message' => "Not Found"
          ];          
          return response()->json($respose , 404);
        }
        return new LectureSectionResource($section);
   }   
  );

  // Route::prefix('/sections')->group(function($lecture_id) {

  //     Route::get('/{section_id}', function($lecture_id, $section_id) {
  //       return new LectureSectionFullResource(LectureSection::find($section_id));
  //     });

  //     Route::get('/', function($lecture_id) {
  //       return LectureSectionResource::collection(Lecture::find($lecture_id)->Sections);
  //     });

  // });
  // Route::prefix('/handwritings')->group(function($lecture_id) {

  //     Route::get('/{handwritings_id}', function($lecture_id, $handwritings_id) {
  //       return new HandwritingFullResource(Handwriting::find($handwritings_id));
  //     });

  //     Route::get('/', function($lecture_id) {
  //       return HandwritingResource::collection(Lecture::find($lecture_id)->Handwriting);
  //     });

  // });

// Socializations
Route::middleware('auth:student-api')->prefix('/conversations')->group(function() {          
  Route::get('/', function() {
    return ConversationResource::collection(Student::find(auth()->user()->id)->Conversations);
  });  
  Route::get('/{id}', function($id) {
    return new ConversationFullResource(Conversation::find($id));
  });  
});  

