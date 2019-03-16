<?php

namespace App\Models\Materials;

use Illuminate\Database\Eloquent\Model;

class Series extends Model
{

  // belongsTo Relations
  public function University() {
    return $this->belongsTo('App\Models\Structure\University');
  }

  public function Faculty() {
    return $this->belongsTo('App\Models\Structure\Faculty');
  }

  public function Department() {
    return $this->belongsTo('App\Models\Structure\Department');
  }

  public function Level() {
    return $this->belongsTo('App\Models\Structure\Level');
  }

  public function Category() {
    return $this->belongsTo('\App\Models\Structure\Category');
  }

  public function Professor() {
    return $this->belongsTo('App\Models\Members\Professor');
  }

  // belongsToMany Relations
  public function Students() {
    return $this->belongsToMany(
      'App\Models\Members\Students\Student',
      'student_assign_series', 'series_id', 'student_id');
  }

  public function Recommendations() {
    return $this->belongsToMany(
      'App\Models\Materials\Recommendation',
      'series_recommendations', 'series_id', 'recommendation_id');
  }

  public function Books() {
    return $this->belongsToMany(
      'App\Models\Materials\Book',
      'series_book', 'series_id', 'book_id');
  }

// hasMany Relations
  public function Lectures() {
    return $this->hasMany('App\Models\Materials\Lecture');
  }

  public function Parts() {
    return $this->hasMany('App\Models\Materials\Part');
  }


  public function Exams() {
    return $this->hasMany('App\Models\Materials\Exam');
  }

}
