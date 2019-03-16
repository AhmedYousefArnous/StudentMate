<?php

namespace App\Http\Resources\Materials;

use Illuminate\Http\Resources\Json\JsonResource;

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
           // 'professor'      => $this->professor_id,
           // 'university'      => new Structure\University($this->University),
           // 'faculty'         => new Structure\Faculty($this->Faculty),
           // 'series'          => new Series($this->Series),

        ];
     }
}
