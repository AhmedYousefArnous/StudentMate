<?php

namespace App\Http\Resources\Socialization;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Student;

class GroupFull extends JsonResource
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
        
            'creator'       => new Student($this->Creator),
            'conversation'  => ConversationFull::collection($this->Conversations),
            'members'       => Student::collection($this->Members),
            'admins'        => Student::collection($this->Admins),
            
        ];
    }
}
