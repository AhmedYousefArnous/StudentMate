<?php
namespace App\Models\Members\Students\Socialization;

use Illuminate\Database\Eloquent\Model;


class Channel extends Model
{ 
    protected $fillable = [
      'name' , 'description'
    ];

    // belongTo Relations
    public function Creator() {
      return $this->belongsTo('App\Models\Members\Students\Student', 'creator_id', 'id');
    }

    // hasMany Relations
    public function Notifications() {
      return $this->hasMany('App\Models\Members\Students\Socialization\ChannelsNotification');
    }

    // belongsToMany Relations
    public function Admins() {
      return $this->belongsToMany(
          'App\Models\Members\Students\Student',
          'channels_admins',
          'channel_id',
          'student_id'
      );
    }
    
    public function Subscribers() {
      return $this->belongsToMany(
          'App\Models\Students\Student', 
          'channels_subscribers', 
          'channel_id', 
          'student_id');
    }

}
