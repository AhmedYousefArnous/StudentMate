<?php

namespace App\Models\Materials;

use Illuminate\Database\Eloquent\Model;

class SeriesVersion extends Model
{
  
  // belongsTo Relations
  public function Series() {
    return $this->belongsTo('App\Models\Materials\Series');
  }
  
  public function Department() {
    return $this->belongsTo('App\Models\Structure\Department');
  }

  public function Level() {
    return $this->belongsTo('App\Models\Structure\Level');
  }

  public function Professor() {
    return $this->belongsTo('App\Models\Members\Professor');
  }

  // Many to many Relations
  public function Recommendations() {
    return $this->belongsToMany(
      'App\Models\Materials\Recommendation',
      'series_recommendations', 'series_version_id', 'recommendation_id');
  }

  public function Books() {
    return $this->belongsToMany(
      'App\Models\Materials\Book',
      'series_book', 'series_version_id', 'book_id');
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

  public function SectionsEntities() {
    return $this->hasMany('App\Models\Materials\SectionEntity');
  }
  
  public function LecturesEntities() {
    return $this->hasMany('App\Models\Materials\LectureEntity');
  }

}
