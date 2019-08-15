<?php

namespace App\Models\Members\Students\Socialization;

use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    // belongsToRelations
    public function Creator() {
        return $this->belongsTo('App\Models\Members\Students\Student');
    }

    // hasMany Relations
    public function Conversations() {
        return $this->hasMany('App\Models\Members\Students\Socialization\Conversation');
      }    

    
    // belongsToMany Relations
    public function Admins() {
        return $this->belongsToMany(
            'App\Models\Members\Students\Student',
            'groups_admins',
            'group_id',
            'student_id'
        );
    }

    public function Members() {
        return $this->belongsToMany(
            'App\Models\Members\Students\Student',
            'groups_members',
            'group_id',
            'student_id'
        );
    }

    

}
