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


}
