<?php

namespace App\Http\Resources\Materials;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Structure\Category;
use App\Http\Resources\Structure\Faculty;
use App\Http\Resources\Structure\Department;
use App\Http\Resources\Structure\Level;

class Series extends JsonResource
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
          'id' => $this->id,
          'name' => $this->name,
          // 'description'   => $this->description,
          // 'professor_id'  => $this->professor_id,
          // 'category'   => $this->Category,
          'category'   => new Category($this->Category),
          'faculty'    => new Faculty($this->Faculty),
          'department' => new Department($this->Department),
          'level'      => new Level($this->Level),

          'created'    => $this->created_at,
          // 'updated_at' => $this->updated_at,
          'banner'     => $this->banner,
          // 'regular_lecture_day' => $this->regular_lecture_day,
          // 'regular_lecture_day_2' => $this->regular_lecture_day_2,
          // 'regular_section_day' => $this->regular_section_day,
          // 'regular_section_day_2' => $this->regular_section_day_2,
          // 'regular_lecture_time' => $this->regular_lecture_time,
          // 'regular_lecture_time_2' => $this->regular_lecture_time_2,
          // 'regular_section_time' => $this->regular_section_time,
          // 'regular_section_time_2' => $this->regular_section_time_2,

        ];
    }
}
