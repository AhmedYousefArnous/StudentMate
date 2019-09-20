<?php

namespace App\Http\Resources\Socialization;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Student as StudentResource;

class Conversation extends JsonResource
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
        'id'        => $this->id,
        'name'      => $this->name,
        'created'   => $this->created_at,
        'last_massage'      => new Messages($this->LastMessage()),
        'opposite_student'  => new StudentResource($this->OppositeStudent()),
      ];
    }
}
