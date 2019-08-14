<?php

namespace App\Models\Structure;

use Illuminate\Database\Eloquent\Model;
use App\Models\Structure\Department;
use App\Models\Members\Student;


class Faculty extends Model
{
    public function Students() {
        return $this->hasMany('App\Models\Members\Student');
    }
    
    public function Departments() {
        return $this->hasMany('App\Models\Structure\Department');
    }
}
