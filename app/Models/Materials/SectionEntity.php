<?php

namespace App\Models\Materials;

use Illuminate\Database\Eloquent\Model;

class SectionEntity extends Model
{
  // belongsTo Relations
  public function SeriesVersion() {
    return $this->belongsTo('\App\Models\Materials\SeriesVersion');
  }
  
}