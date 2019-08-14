<?php
namespace App\Http\Resources;
// "username": true,
// "name_arabic": true,
// "university": true,
// "faculty": true,
// "department": true,
// "level": true,
  $options = json_decode($this->options);

  return [
    'id'              => $this->id ,
    'joined'          => $this->created_at,
    'name'            => $options->username ? $this->username : null ,
    'name_arabic'     => $options->name_arabic ? $this->username_ar : null,
    'university'      => $options->university ? new Structure\University($this->University): null,
    'faculty'         => $options->faculty ? new Structure\Faculty($this->Faculty) : null,
    'department'      => $options->department ? new Structure\Department($this->Department) : null,
    'level'           => $options->level ?new Structure\Level($this->Level) : null,
    'section'         => $options->section ? $this->section : null,
    'term'            => $options->term_no ? $this->term 
                                        ( $this->term ? 'Second' : 'First') : null, 
    'gender'          => $options->gender ? 
                                        ( $this->gender ? 'Male' : 'Famale') : null,
    // 'nationality'     => $this->nationality,
    // 'options'         => $options,
    'email'           => $options->email ? $this->email : null,
    'phone'           => $options->phone_number ?  $this->phone : null ,
  ];
