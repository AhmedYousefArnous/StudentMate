<?php

namespace App\Http\Resources\Materials;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Student as StudentResource;
use App\Models\Members\Students\Student;

class Handwriting extends JsonResource
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
            "id"            => $this->id,
            "creator"       => new StudentResource(Student::findOrFail($this->creator_id)),
            "name"          => $this->name,
            "url"           => json_decode($this->url),
            "created"       => $this->created
        ];
    }
}
