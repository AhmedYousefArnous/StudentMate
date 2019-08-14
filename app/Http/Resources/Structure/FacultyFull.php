<?php

namespace App\Http\Resources\Structure;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Structure\Department;

class FacultyFull extends JsonResource
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
            'id'                => $this->id,
            'name'              => $this->name,
            'departments'       => Department::collection(($this->Departments)),
            // 'head_professor_id' => $this->head_professor_id,
            // 'description' => $this->description,
            // 'banner' => $this->banner,
            // 'university_id' => $this->university_id,
            // 'created_at' => $this->created_at,
            // 'updated_at' => $this->updated_at,
            ];
    }
}
