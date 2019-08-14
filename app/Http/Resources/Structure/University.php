<?php

namespace App\Http\Resources\Structure;

use Illuminate\Http\Resources\Json\JsonResource;

class University extends JsonResource
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
