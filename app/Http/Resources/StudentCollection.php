<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class StudentCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return parent::toArray($request);
        // return [
        //   $this->collection,
        //   'university' => new University($this->university_id)
        // ];
    }


    // public function with($request) {
    //   return [
    //     $this->collection,
    //     'university' => new University($this->university_id)
    //   ];
    // }




}
