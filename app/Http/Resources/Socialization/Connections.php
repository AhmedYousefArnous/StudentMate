<?php

namespace App\Http\Resources\Socialization;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Student as StudentResource;
use App\Models\Members\Students\Student;

class Connections extends JsonResource
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
          'id'           => $this->id,
          'sender'    => new StudentResource(Student::find($this->sender_id)),
          'reciever'    => new StudentResource(Student::find($this->reciever_id)),
          'blocker'    => new StudentResource(Student::find($this->blocker_id)),
          'created'      => $this->created_at
        ];
    }
}
