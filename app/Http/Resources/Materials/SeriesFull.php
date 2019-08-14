<?php

namespace App\Http\Resources\Materials;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Structure\Category;
use App\Http\Resources\Structure\Faculty;
use App\Http\Resources\Structure\University;

class SeriesFull extends JsonResource
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
            
            
            'created'    => $this->created_at,
            // 'category'   => new Category($this->Category),
            // 'banner'     => $this->banner,
            'description'   => $this->description,
            // 'professor_id'  => $this->professor_id,
            // 'updated'       => $this->updated_at,
          ];
    }
}
