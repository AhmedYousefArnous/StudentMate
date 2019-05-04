<?php

namespace App\Models\Members\Students\Socialization;

use Illuminate\Database\Eloquent\Model;


class Conversation extends Model
{
  // belongsToMany Relations
  public function Students() {
      return $this->belongsToMany(
        'App\Models\Members\Students\Student',
        'conversations_students', 'conversation_id', 'student_id');
  }
  // belongsTo Relations
  public function Group() {
    return $this->belongsTo('App\Models\Members\Students\Socialization\Group');
  }
  // hasMany Relations
  public function Messages() {
    return $this->hasMany('App\Models\Members\Students\Socialization\Message');
  }
}
