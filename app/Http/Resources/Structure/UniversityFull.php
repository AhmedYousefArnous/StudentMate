<?php

namespace App\Http\Resources\Structure;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Structure\FacultyFull;

class UniversityFull extends JsonResource
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
            'faculties'       => FacultyFull::collection(($this->Faculties)),
          //   'enrolled_series' => Materials\Series::collection($this->Series),
            // 'description'     => $this->description,
            // 'head_professor'  => $this->head_professor_id,
            //  'banner'          => $this->banner,
            // 'region'          => $this->region,
            // 'created_at'      => $this->created_at,
            // 'updated_at'      => $this->updated_at,
          ];
    }
}
