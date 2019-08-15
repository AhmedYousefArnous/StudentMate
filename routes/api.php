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

use App\Http\Resources\Socialization\groupFull as groupFullResource;

use App\Http\Resources\Socialization\Channel as ChannelResource;
use App\Http\Resources\Socialization\ChannelFull as ChannelFullResource;

// Models
use App\Models\Members\Students\Student;

use App\Models\Structure\University;

use App\Models\Materials\Series;
use App\Models\Materials\SeriesVersion;
use App\Models\Materials\Lecture;
use App\Models\Materials\LectureSection;
use App\Models\Materials\Handwriting;

use App\Models\Members\Students\Socialization\Conversation;
use App\Models\Members\Students\Socialization\Channel;
use App\Models\Members\Students\Socialization\Group;

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

// Materials
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


// Socializations
// Conversations
Route::middleware('auth:student-api') 
  ->name('api.student.conversastion')
  ->get('/conversations/{conversation_id}', function($conversation_id) {
        $conversation = Student::find(auth()->user()->id)->Conversations()->find($conversation_id);
        return new ConversationFullResource($conversation);
});  

// Channels
// ALL
Route::middleware('auth:student-api') 
  ->name('api.channels')
  ->get('/channels', function() {
        return ChannelResource::collection(Channel::all());
});  
// Specific
Route::middleware('auth:student-api') 
  ->name('api.student.channels')
  ->get('/channels/{channel_id}', function($channel_id) {    
        return new  ChannelFullResource(Channel::find($channel_id));
});

// Groups
// Subscribed
Route::middleware('auth:student-api') 
  ->name('api.student.group.subcribed')
  ->get('/groups/subscribed/{group_id}', function($group_id) {
        $group = Student::find(auth()->user()->id)->SubsribedGroups()->find($group_id);
        return new groupFullResource($group);
});
// Managed
Route::middleware('auth:student-api') 
  ->name('api.student.group.managed')
  ->get('/groups/managed/{group_id}', function($group_id) {
        $group = Student::find(auth()->user()->id)->ManagedGroups()->find($group_id);
        return new groupFullResource($group);
});
