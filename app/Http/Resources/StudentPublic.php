<?php
namespace App\Http\Resources;

  return [
    'id'              => $this->id,
    'name'            => $this->username,
    'name_arabic'     => $this->username_ar,
    'university'      => new Structure\University($this->University),
    'faculty'         => new Structure\Faculty($this->Faculty),
    'department'      => new Structure\Department($this->Department),
    'level'           => new Structure\Level($this->Level),
    'section'         => $this->section,
    'term'            => $this->term,
    'gender'          => $this->gender,
    'nationality'     => $this->nationality
  ];
