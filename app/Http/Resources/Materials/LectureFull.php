<?php

namespace App\Http\Resources\Materials;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Members\Professor;

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
        return [
          'id'      => $this->id,
          'name'    => $this->name,
          'created' => $this->created_at,

          'description'   => $this->description,
          'video_url'     => $this->video_url,
          'slides'        => json_decode($this->slides),
          'sections'      => LectureSection::collection($this->Sections),
          'handwriting'   => Handwriting::collection($this->Handwriting),
          'professor'     => new Professor($this->Professor),
          'series'        => new Series($this->Series)
        ];
    }

}
