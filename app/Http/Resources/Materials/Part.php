<?php

namespace App\Http\Resources\Materials;

use Illuminate\Http\Resources\Json\JsonResource;

class Part extends JsonResource
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
            'id'      => $this->id,
            'name'    => $this->name,
            'created' => $this->created_at,
            'creator' => $this->creator,
            'url'     => json_decode($this->url)
         ];
      }
}
