<?php

namespace App\Http\Resources\Structure;

use Illuminate\Http\Resources\Json\JsonResource;

class Category extends JsonResource
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
          // 'description' => $this->description,
          'cover_image' => $this->cover_image,
          'parent_id'   => $this->when($this->parent_id, function( ) {
            return  new Category($this->Parent);
          }),
          'created_at'  => $this->created_at,
          // 'creator_id'  => $this->creator_id,

        ];
    }
}
