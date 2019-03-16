<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Student extends JsonResource
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
            'name'            => $this->username,
            'name_arabic'     => $this->fullname_ar,
            'profile_picture' => $this->profile_picture,
            'university'      => new Structure\University($this->University),
            'faculty'         => new Structure\Faculty($this->Faculty),
            'department'      => new Structure\Department($this->Department),
            'section'         => new Structure\Section($this->Section),
            'level'           => new Structure\Level($this->Level),
            'gender'          => $this->gender,
            'nationality'     => $this->nationality,
        ];
    }
}
