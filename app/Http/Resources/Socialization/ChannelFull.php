<?php

namespace App\Http\Resources\Socialization;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Student;

class ChannelFull extends JsonResource
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
            'name'            => $this->name,
            'description'     => $this->description,
            
            'created'         => $this->created_at,
            'creator'         => new Student($this->Creator),
            'notifications'   => Notification::collection($this->Notifications),
            'admins'          => Student::collection($this->Admins)
          ];
   
    }
}
