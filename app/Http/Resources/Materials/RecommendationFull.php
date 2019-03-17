<?php

namespace App\Http\Resources\Materials;

use Illuminate\Http\Resources\Json\JsonResource;

class RecommendationFull extends JsonResource
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
          'id'          => $this->id,
          'name'        => $this->name,

          'description' => $this->description,
          'url'         => $this->url,
          'created'     => $this->created_at,
          'series'      => Series::collection($this->Series)
        ];
    }

}
