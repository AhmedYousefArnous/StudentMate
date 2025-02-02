<?php

namespace App\Models\Materials;

use Illuminate\Database\Eloquent\Model;


class Book extends Model
{
  public function Series() {
    return $this->belongsToMany(
      'App\Models\Materials\SeriesVersion',
      'series_book', 'book_id', 'series_version_id');
  }
}
