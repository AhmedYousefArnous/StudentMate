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
use App\Http\Resources\Materials\LectureSectionFull as LectureSectionFullResource;

use App\Http\Resources\Materials\Handwriting as HandwritingResource;
use App\Http\Resources\Materials\HandwritingFull as HandwritingFullResource;

use App\Http\Resources\Materials\Recommendation as RecommendationResource;
use App\Http\Resources\Materials\RecommendationFull as RecommendationFullResource;

use App\Http\Resources\Materials\Book as BookResource;
use App\Http\Resources\Materials\BookFull as BookFullResource;

use App\Http\Resources\Materials\Part as PartResource;
use App\Http\Resources\Materials\PartFull as PartFullResource;

use App\Http\Resources\Materials\Exam as ExamResource;
use App\Http\Resources\Materials\ExamFull as ExamFullResource;

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
use App\Models\Materials\Recommendation;
use App\Models\Materials\Book;
use App\Models\Materials\Part;
use App\Models\Materials\Exam;

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
    return new SeriesFullResource(Series::find($id));
  });

  Route::get('/{id}/{year}', function($id, $year) {
    return new SeriesVersionFullResource(SeriesVersion::where('year', $year)->firstOrFail());
  });
});

Route::middleware('auth:student-api')->prefix('lectures/{lecture_id}')->group(function($lecture_id) {

      Route::prefix('/sections')->group(function($lecture_id) {

          Route::get('/{section_id}', function($lecture_id, $section_id) {
            return new LectureSectionFullResource(LectureSection::find($section_id));
          });

          Route::get('/', function($lecture_id) {
            return LectureSectionResource::collection(Lecture::find($lecture_id)->Sections);
          });

      });
      Route::prefix('/handwritings')->group(function($lecture_id) {

          Route::get('/{handwritings_id}', function($lecture_id, $handwritings_id) {
            return new HandwritingFullResource(Handwriting::find($handwritings_id));
          });

          Route::get('/', function($lecture_id) {
            return HandwritingResource::collection(Lecture::find($lecture_id)->Handwriting);
          });

      });
      Route::get('/', function($lecture_id) {
        return new LectureFullResource(Lecture::find($lecture_id));
      });

});

// Socializations
Route::middleware('auth:student-api')->prefix('/conversations')->group(function() {          
  Route::get('/', function() {
    return ConversationResource::collection(Student::find(auth()->user()->id)->Conversations);
  });  
  Route::get('/{id}', function($id) {
    return new ConversationFullResource(Conversation::find($id));
  });  
});  

