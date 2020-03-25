<?php

namespace App\Http\Resources\Materials;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Structure\Department;
use App\Http\Resources\Structure\Level;

use App\Http\Resources\Members\Professor;

use App\Http\Resources\Materials\Lecture;
use App\Http\Resources\Materials\Recommendation;
use App\Http\Resources\Materials\Exam;
use App\Http\Resources\Materials\Part;
use App\Http\Resources\Materials\Book;
use App\Http\Resources\Materials\LectureEntity;
use App\Http\Resources\Materials\SectionEntity;

class SeriesVersionFull extends JsonResource
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
            'id'            => $this->id,
            'year'          => $this->year,
            'department'    => new Department($this->Department),
            'level'         => new Level($this->Level),
            'professor'     => new Professor($this->Professor),
    
            'created'    => $this->created_at,
            'term'          => $this->term ? 'Second' : 'First', 

            
            'regular_lecture_day' => $this->regular_lecture_day,
            'regular_lecture_day_2' => $this->regular_lecture_day_2,
            'regular_lecture_time' => $this->regular_lecture_time,
            'regular_lecture_time_2' => $this->regular_lecture_time_2,
            
            'regular_section_day' => $this->regular_section_day,
            'regular_section_day_2' => $this->regular_section_day_2,
            'regular_section_time' => $this->regular_section_time,
            'regular_section_time_2' => $this->regular_section_time_2,

            'recommendations'       => Recommendation::collection($this->Recommendations),
            'lectures'              => Lecture::collection($this->Lectures),
            'books'                 => Book::collection($this->Books),
            'parts'                 => Part::collection($this->Parts),
            'exams'                 => Exam::collection($this->Exams),
            'lecturesEntities'      => lectureEntity::collection($this->LecturesEntities),
            'SectionsEntities'      => SectionEntity::collection($this->SectionsEntities)
          ];
 
    }
}
