<?php

namespace App\Http\Resources\Socialization;

use Illuminate\Http\Resources\Json\JsonResource;
// use App\Models\Members\Students\Student;
use App\Http\Resources\Student;
class ConversationFull extends JsonResource
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
         'id'        => $this->id,
         'name'      => $this->name,
         'created'   => $this->created_at,
         
         'messages'  => Messages::collection($this->Messages),
         'students'  => Student::collection($this->Students)
       ];
     }
}
