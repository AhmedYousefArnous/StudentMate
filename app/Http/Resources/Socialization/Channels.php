<?php

namespace App\Http\Resources\Socialization;

use Illuminate\Http\Resources\Json\JsonResource;

class Channels extends JsonResource
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
          // 'description' =>$this->description,
          'created'     => $this->created_at,
          // 'creator'     => $this->creator_id
        ];
    }
}
