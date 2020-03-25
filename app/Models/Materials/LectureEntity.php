<?php

namespace App\Models\Materials;

use Illuminate\Database\Eloquent\Model;

class LectureEntity extends Model
{

  // belongsTo Relations
  public function SeriesVersion() {
    return $this->belongsTo('\App\Models\Materials\SeriesVersion');
  }
  
}