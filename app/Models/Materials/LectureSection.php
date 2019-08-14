<?php

namespace App\Models\Materials;

use Illuminate\Database\Eloquent\Model;


class LectureSection extends Model
{
  public function Lecture() {
    return $this->belongsTo('App\Models\Materials\Lecture');
  }

  public function Demonstrator() {
    return $this->belongsTo('App\Models\Members\Demonstrator');
  }

}
