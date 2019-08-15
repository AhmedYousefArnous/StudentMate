<?php

namespace App\Models\Members\Students;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;

class Student extends \TCG\Voyager\Models\User
{
    use Notifiable, HasApiTokens;

    // belongsTo Relations
    public function University() {
      return $this->belongsTo('App\Models\Structure\University');
    }

    public function Faculty() {
      return $this->belongsTo('App\Models\Structure\Faculty');
    }

    public function Department() {
      return $this->belongsTo('App\Models\Structure\Department');
    }


    public function Level() {
      return $this->belongsTo('App\Models\Structure\Level');
    }


    // belongsToMany Relations
    public function Series() {  
        return $this->belongsToMany('App\Models\Materials\Series','students_series', 'student_id', 'series_id');
    }

    public function Conversations() {
        return $this->belongsToMany(
          'App\Models\Members\Students\Socialization\Conversation',
          'conversations_students', 'student_id', 'conversation_id')
                    ->where('group_id' ,null);
    }

    public function Channels() {
      return $this->belongsToMany(
        'App\Models\Members\Students\Socialization\Channel',
         'channels_subscribers', 'student_id', 'channel_id');
    }

    public function SubsribedGroups() {
      return $this->belongsToMany(
        'App\Models\Members\Students\Socialization\Group',
         'groups_members', 'student_id', 'group_id');
    }

    public function ManagedGroups() {
      return $this->belongsToMany(
        'App\Models\Members\Students\Socialization\Group',
         'groups_admins', 'student_id', 'group_id');
    }
    // hasMany
    public function SendConnections() {
      return $this->hasMany('App\Models\Members\Students\Socialization\Connection',
        'sender_id',
        'id'
      );
    }

    public function ReceivedConnections() {
      return $this->hasMany('App\Models\Members\Students\Socialization\Connection',
        'reciever_id',
        'id'
      );
    }

    public function BlockedConnections() {
      return $this->hasMany('App\Models\Members\Students\Socialization\Connection',
        'blocker_id',
        'id'
      );
    }
}
