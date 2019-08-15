<?php
namespace App\Models\Members\Students\Socialization;

use Illuminate\Database\Eloquent\Model;


class Channel extends Model
{
    public function Subscribers() {
      return $this->belongsToMany(
          'App\Models\Students\Student', 
          'channels_subscriber', 
          'channel_id', 
          'student_id');
    }
}
