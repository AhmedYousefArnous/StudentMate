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


// Models
use App\Models\Members\Students\Student;

use App\Models\Structure\University;

use App\Models\Materials\Series;
use App\Models\Materials\SeriesVersion;
use App\Models\Materials\Lecture;
use App\Models\Materials\LectureSection;
use App\Models\Materials\Handwriting;

use App\Models\Members\Students\Socialization\Channel;

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
  Route::post('/options', 'API\StudentProfileController@updateProfileOptions')->name('api.student.profile.updateOptions');

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
// Connections
Route::middleware('auth:student-api')->prefix('connections')->group(function() {
  
  Route::post('/','API\Socialization\ConnectionsAPIController@create')
            ->name('api.connections.create');

  Route::delete('/{connection_id}','API\Socialization\ConnectionsAPIController@destroy')
            ->name('api.connections.destroy');

  Route::post('/{id}/accept','API\Socialization\ConnectionsAPIController@accept')
            ->name('api.connections.accept');

  Route::post('/{id}/block','API\Socialization\ConnectionsAPIController@block')
            ->name('api.connections.block');

  Route::post('/{id}/unblock','API\Socialization\ConnectionsAPIController@unblock')
            ->name('api.connections.unblock');
});
// Conversations  
Route::middleware('auth:student-api')->prefix('conversations')->group(function() {
  Route::get('/{conversation_id}', 'API\Socialization\ConversationsAPIController@show')
                ->name('api.conversastions');

  Route::post('/', 'API\Socialization\ConversationsAPIController@create')
                ->name('api.Conversations.create');

  Route::post('/{conversation_id}', 'API\Socialization\ConversationsAPIController@update')
                ->name('api.Conversations.update');
  
  Route::delete('/{conversation_id}', 'API\Socialization\ConversationsAPIController@destroy')
                ->name('api.Conversations.destroy');
  
  // Messages
  Route::post('/{conversation_id}/messages', 'API\Socialization\MessagesAPIController@createMessage')
                ->name('api.Conversations.Messages.create');

  Route::delete('/{conversation_id}/messages/{message_id}/{me}', 'API\Socialization\MessagesAPIController@delete')
              ->name('api.Conversations.Messages.delete');
  
});
// Channels
Route::middleware('auth:student-api')->prefix('channels')->group(function() {
  Route::get('/', 'API\Socialization\ChannelAPIController@index')
                ->name('api.channels');

  Route::post('/', 'API\Socialization\ChannelAPIController@create')
                ->name('api.channels.create');

  Route::post('/{channel_id}', 'API\Socialization\ChannelAPIController@update')
                ->name('api.channels.update');

  Route::get('/{channel_id}', 'API\Socialization\ChannelAPIController@show')
                ->name('api.student.channels');

  Route::delete('/{channel_id}', 'API\Socialization\ChannelAPIController@destroy')
              ->name('api.student.channels.destroy');
  
 Route::post('/subscription/{channel_id}', 'API\Socialization\ChannelAPIController@subscribe')
              ->name('api.channels.subscribe');

 Route::delete('/subscription/{channel_id}', 'API\Socialization\ChannelAPIController@unsubscribe')
              ->name('api.channels.unsubscribe');

  Route::post('/admin/{channel_id}/{student_id}', 'API\Socialization\ChannelAPIController@makeAdmin')
              ->name('api.channels.make.admin');

  Route::delete('/admin/{channel_id}/{student_id}', 'API\Socialization\ChannelAPIController@removeAdmin')
              ->name('api.channels.remove.admin');

  Route::prefix('/{channel_id}/notifications/')->group(function() {
    Route::post('/', 'API\Socialization\NotificationsAPIController@addNotification')
      ->name('api.channels.notifications.add');

    Route::post('/{notification_id}', 'API\Socialization\NotificationsAPIController@updateNotification')
        ->name('api.channels.notifications.update');

    Route::delete('/{notification_id}', 'API\Socialization\NotificationsAPIController@deleteNotification')
      ->name('api.channels.notifications.destroy');
  });
});

// Groups
Route::middleware('auth:student-api')->prefix('groups')->group(function() {
  // Index
  Route::get('subscribed/{group_id}', 'API\Socialization\GroupsAPIController@indexSubscribed')
            ->name('api.groups.subcribed');

  Route::get('managed/{group_id}', 'API\Socialization\GroupsAPIController@indexManaged')
            ->name('api.groups.managed');

  // CRUD
  Route::post('/', 'API\Socialization\GroupsAPIController@create')
            ->name('api.groups.create');

  Route::post('/{group_id}', 'API\Socialization\GroupsAPIController@update')
            ->name('api.groups.update');
  // Students          
  Route::post('/{group_id}/students/', 'API\Socialization\GroupsAPIController@addStudents')
          ->name('api.groups.students.add');

  Route::post('/{group_id}/students/remove', 'API\Socialization\GroupsAPIController@removeStudents')
          ->name('api.groups.students.remove');

  Route::delete('/{group_id}/students/leave', 'API\Socialization\GroupsAPIController@leave')
          ->name('api.groups.students.leave');

  // Admins
  Route::post('/{group_id}/admins/', 'API\Socialization\GroupsAPIController@addAdmins')
          ->name('api.groups.admins.add');

  Route::post('/{group_id}/admins/remove', 'API\Socialization\GroupsAPIController@removeAdmins')
          ->name('api.groups.admins.remove');

  // Conversations
  Route::post('/{group_id}/conversations/', 'API\Socialization\GroupsAPIController@addConversation')
          ->name('api.groups.conversations.add');

  Route::delete('/{group_id}/conversations/{conversation_id}', 'API\Socialization\GroupsAPIController@removeConversation')
          ->name('api.groups.conversations.remove');
  
});

