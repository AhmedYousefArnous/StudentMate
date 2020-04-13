<?php

namespace App\Http\Resources\Materials;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Members\Demonstrator;

class LectureSectionFull extends JsonResource
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
           'id'            => $this->id,
           'name'          => $this->name,
           'created'       => $this->created_at,
           'demonstrator' => new Demonstrator($this->Demonstrator),
           'url'           => json_decode($this->url),
          //  'lecture'       => new Lecture($this->Lecture),
           'description'   => $this->description,
           'video_url'     => $this->video_url
         ];
     }

}
