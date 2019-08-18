<?php

namespace App\Models\Members\Students\Socialization;

use Illuminate\Database\Eloquent\Model;
use App\Models\Members\Students\Student;

class Connection extends Model
{
  protected $fillable = [
    'sender_id', 'block', 'blocker_id'
  ];

  public function Sender() {
    return $this->belongsTo('App\Models\Members\Students\Student', 'sender_id', 'id');
  }

  public function Reciever() {
    return $this->belongsTo('App\Models\Members\Students\Student', 'reciever_id', 'id');
  }

  public function Blocker() {
    return $this->belongsTo('App\Models\Members\Students\Student', 'blocker_id', 'id');
  }
}
