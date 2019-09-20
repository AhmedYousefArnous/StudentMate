<?php

namespace App\Models\Members\Students\Socialization;

use Illuminate\Database\Eloquent\Model;


class Conversation extends Model
{
  protected $fillable = [
    'name', 'group_id'
  ];
  // belongsToMany Relations
  public function Students() {
      return $this->belongsToMany(
        'App\Models\Members\Students\Student',
        'conversations_students', 'conversation_id', 'student_id');
  }

  // belongsTo Relations
  public function OppositeStudent() {
    return $this->Students()->where('student_id', '<>', auth()->user()->id)->first();
  }
  
  public function Group() {
    return $this->belongsTo('App\Models\Members\Students\Socialization\Group');
  }
 
  // hasMany Relations
  public function Messages() {
    return $this->hasMany('App\Models\Members\Students\Socialization\Message')
                ->where('delete_for_me', '<>' , 1);
  }

  public function LastMessage() {
    return $this->hasMany('App\Models\Members\Students\Socialization\Message')
                ->where('delete_for_me', '<>' , 1)
                ->orderBy('id', 'desc')
                ->first();
  }
}
