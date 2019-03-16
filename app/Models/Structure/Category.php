<?php

namespace App\Models\Structure;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
  public function Series() {
    return $this->hasMany('App\Models\Materials\Series');
  }

  public function Parent()
  {
      return $this->belongsTo(self::class);
  }

}
