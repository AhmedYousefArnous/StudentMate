<?php

namespace App\Models\Materials;

use Illuminate\Database\Eloquent\Model;


class Exam extends Model
{
  public function Professor() {
    return $this->belongsTo('App\Models\Members\Professor');
  }
}
