<?php

namespace App\Http\Resources\Materials;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Members\Professor;

class Exam extends JsonResource
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
            'id'             => $this->id,
            'name'           => $this->name,
            'professor'      => new Professor($this->Professor),
            'year'           => $this->year,
            'url'            => json_decode($this->url),
            'created'        => $this->created_at 
        ];
     }

}
