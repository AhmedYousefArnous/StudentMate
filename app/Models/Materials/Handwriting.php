<?php

namespace App\Models\Materials;

use Illuminate\Database\Eloquent\Model;


class Handwriting extends Model
{
  public function Student() {
    return $this->belongsTo('App\Models\Members\Students\Student');
  }

  public function Lecture() {
    return $this->belongsTo('App\Models\Materials\Lecture');
  }

}
