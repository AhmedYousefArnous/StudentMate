<?php

namespace App\Models\Materials;

use Illuminate\Database\Eloquent\Model;


class Exam extends Model
{
  // belongsTo Relations
  public function Professor() {
    return $this->belongsTo('App\Models\Members\Professor');
  }

  public function Series() {
    return $this->belongsTo('App\Models\Materials\SeriesVersion');
  }

  public function Faculty() {
    return $this->belongsTo('App\Models\Structure\Faculty');
  }

  public function University() {
    return $this->belongsTo('App\Models\Structure\University');
  }
}
