<?php

namespace App\Http\Resources\Materials;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Structure\Faculty;
use App\Http\Resources\Structure\University;
use App\Http\Resources\Materials\SeriesVersion;


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
            'university' => new University($this->University),
            'faculty'    => new Faculty($this->Faculty),
            'verions'       => SeriesVersion::collection($this->Versions),
          ];
 
    }
}
