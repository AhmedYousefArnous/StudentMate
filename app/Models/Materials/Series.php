<?php

namespace App\Models\Materials;

use Illuminate\Database\Eloquent\Model;

class Series extends Model
{
  
  // belongsTo Relations
  public function Category() {
    return $this->belongsTo('\App\Models\Structure\Category');
  }

  public function University() {
    return $this->belongsTo('App\Models\Structure\University');
  }

  public function Faculty() {
    return $this->belongsTo('App\Models\Structure\Faculty');
  }

  public function Level() {
    return $this->belongsTo('App\Models\Structure\Level');
  }

  public function Professor() {
    return $this->belongsTo('App\Models\Members\Professor');
  }

  // belongsToMany Relations
  // public function Students() {
  //   return $this->belongsToMany(
  //     'App\Models\Members\Students\Student',
  //     'students_series', 'series_id', 'student_id');
  // }
  
  // hasMany Relations
  public function Versions() {
    return $this->hasMany('App\Models\Materials\SeriesVersion');
  }
}
