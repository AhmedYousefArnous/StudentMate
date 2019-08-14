<?php

namespace App\Http\Resources\Materials;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Structure\Department;
use App\Http\Resources\Structure\Level;


class SeriesVersion extends JsonResource
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
            'year'          => $this->year,
            'department'    => new Department($this->Department),
            'level'         => new Level($this->Level),
          ];
    }
}
