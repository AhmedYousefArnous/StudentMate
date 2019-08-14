<?php

namespace App\Models\Structure;

use Illuminate\Database\Eloquent\Model;
use App\Models\Members\Student;
use App\Models\Structure\Faculty;

class University extends Model
{
  public function Students() {
    return $this->hasMany('App\Models\Members\Student');
  }

  public function Faculties() {
    return $this->hasMany('App\Models\Structure\Faculty');
  }

}
