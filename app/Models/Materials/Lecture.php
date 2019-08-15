<?php

namespace App\Models\Materials;

use Illuminate\Database\Eloquent\Model;


class Lecture extends Model
{
    // belongsTo Relations
    public function Series() {
      return $this->belongsTo('App\Models\Materials\SeriesVersion');
    }

    public function Professor() {
      return $this->belongsTo('App\Models\Members\Professor');
    }


    // hasMany Relations
    public function Sections() {
      return $this->hasMany('App\Models\Materials\LectureSection');
    }

    public function Handwriting() {
      return $this->hasMany('App\Models\Materials\Handwriting');
    }

}
