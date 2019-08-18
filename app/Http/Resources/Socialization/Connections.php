<?php

namespace App\Http\Resources\Socialization;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Student;
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
          'sender_id'    => $this->sender_id,
          'reciever_id'  => $this->reciever_id,
          'created'      => $this->created_at
        ];
    }
}
