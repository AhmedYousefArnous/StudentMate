<?php

namespace App\Models\Materials;

use Illuminate\Database\Eloquent\Model;


class Recommendation extends Model
{
    public function Series() {
      return $this->belongsToMany(
        'App\Models\Materials\Series',
        'series_recommendations', 'recommendation_id', 'series_id');
    }
}
