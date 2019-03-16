<?php

namespace App\Http\Resources\Materials;

use Illuminate\Http\Resources\Json\JsonResource;

class LectureFull extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {

      public function toArray($request)
      {
          return [
            'id'      => $this->id,
            'name'    => $this->name,
            'created' => $this->created_at,

            'description'   => $this->description,
            // 'professor_id'  => $this->professor_id,
            'video_url'     => $this->video_url,
            'slides'     => json_decode($this->slides)

          ];
      }
    }
}
