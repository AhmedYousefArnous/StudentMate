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
          'category'   => new Category($this->Category),
          'faculty'    => new Faculty($this->Faculty),
          'department' => new Department($this->Department),
          'level'      => new Level($this->Level),
          'created'    => $this->created_at,
          'banner'     => $this->banner,

        ];
    }
}
