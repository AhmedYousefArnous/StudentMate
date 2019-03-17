<?php

namespace App\Http\Resources\Materials;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Members\Professor;
use App\Http\Resources\Structure\Faculty;
use App\Http\Resources\Structure\University;

class ExamFull extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */

     public function toArray($request)
     {
         return [
           'id'      => $this->id,
           'name'    => $this->name,
           'year'    => $this->year,

           'url'     => json_decode($this->url),
           'professor'             => new Professor($this->Professor),
           'university'            => new University($this->University),
           'faculty'               => new Faculty($this->Faculty),
           'series'                => new Series($this->Series),

        ];
     }
}
