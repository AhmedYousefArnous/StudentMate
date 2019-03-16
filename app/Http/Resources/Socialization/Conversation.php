<?php

namespace App\Http\Resources\Socialization;

use Illuminate\Http\Resources\Json\JsonResource;

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
          'group'     => $this->group,
          'created'   => $this->created_at,
        ];
    }
}
