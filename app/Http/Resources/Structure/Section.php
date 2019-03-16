<?php

namespace App\Http\Resources\Structure;

use Illuminate\Http\Resources\Json\JsonResource;

class Section extends JsonResource
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
          'id'            => $this->id,
          'number'        => $this->id,
          // 'faculty_id'    => $this->faculty_id,
          'department_id' => $this->department_id,
          'level_id'      => $this->level_id,
          'created_at'    => $this->level_id,
          // 'updated_at'    => $this->level_id,

        ];
    }
}
