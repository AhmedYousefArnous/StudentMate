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


use App\Models\Members\Students\Student;

use App\Models\Materials\Series;
use App\Models\Materials\Lecture;
use App\Models\Materials\LectureSection;
use App\Models\Materials\Handwriting;
use App\Models\Materials\Recommendation;
use App\Models\Materials\Book;
use App\Models\Materials\Part;
use App\Models\Materials\Exam;
use App\Models\Members\Students\Socialization\Conversation;

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

  // Route::

});


Route::middleware('auth:student-api')
            ->get('/first/content', 'API\StudentProfileController@firstProfileContent')
            ->name('api.student.profile.first.update.content');
// prefix('/first')->group(function() {
//   Route::get('/', function() {
//     return UniversityResource::collection(University::all());
//   });
//   // Route::get('/{id}', function($id) {
//   //   return new ConversationFullResource(Conversation::find($id));
//   // });
// });


Route::middleware('auth:student-api')->prefix('/conversations')->group(function() {
  Route::get('/', function() {
    return ConversationResource::collection(Student::find(auth()->user()->id)->Conversations);
  });
  Route::get('/{id}', function($id) {
    return new ConversationFullResource(Conversation::find($id));
  });
});

Route::middleware('auth:student-api')->prefix('series')->group(function() {

  Route::prefix('{series_id}/recommendations')->group(function($series_id) {
    Route::get('/', function($series_id) {
      return RecommendationResource::collection(Series::find($series_id)->Recommendations);
    });
    Route::get('/{id}', function($series_id, $id) {
      return new RecommendationFullResource(Recommendation::find($id));
    });
  });
  Route::prefix('{series_id}/books')->group(function($series_id) {
    Route::get('/', function($series_id) {
      return BookResource::collection(Series::find($series_id)->Books);
    });
    Route::get('/{id}', function($series_id, $id) {
      return new BookFullResource(Book::find($id));
    });
  });
  Route::prefix('{series_id}/parts')->group(function($series_id) {
    Route::get('/', function($series_id) {
      return PartResource::collection(Series::find($series_id)->Parts);
    });
    Route::get('/{id}', function($series_id, $id) {
      return new PartFullResource(Part::find($id));
    });
  });
  Route::prefix('{series_id}/exams')->group(function($series_id) {
    Route::get('/', function($series_id) {
      return ExamResource::collection(Series::find($series_id)->Exams);
    });
    Route::get('/{id}', function($series_id, $id) {
      return new ExamFullResource(Exam::find($id));
    });
  });

  Route::get('/{id}', function($id) {
    return new SeriesFullResource(Series::find($id));
  });
  Route::get('/', function() {
    return SeriesResource::collection(Student::find(auth()->user()->id)->Series);
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
