<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Members\Student;

class University extends Model
{
  public function Students() {
    return $this->hasMany('App\Models\Members\Student');
  }
}
