<?php
require_once "resources-imports.php";
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
