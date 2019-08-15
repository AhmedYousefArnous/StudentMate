<?php

namespace App\Http\Resources\Socialization;

use Illuminate\Http\Resources\Json\JsonResource;

class Notification extends JsonResource
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
            'id'              => $this->id,
            'created'         => $this->created_at,
            'content'         => $this->content,
            'url'             => json_decode($this->media_url),
            'media_type'      => $this->media_type
          ];
    }
}
