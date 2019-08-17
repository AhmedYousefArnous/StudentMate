<?php

namespace App\Http\Resources\Socialization;

use Illuminate\Http\Resources\Json\JsonResource;

class Messages extends JsonResource
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
        'sender_id'       => $this->sender_id,
        'created'         => $this->created_at,
        'message'         => $this->message,
        'url'             => json_decode($this->media_url),
        'delete_for_me'   => $this->delete_for_me,
        'media_type'      => $this->media_type
      ];
  }
}
