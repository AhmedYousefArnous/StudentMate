<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Feedback extends Model
{
    protected $fillable = [
        'message', 'media'
    ];
    
    protected $hidden = [
        'student_id'
    ];

    // belongsToRelation
    public function Student() {
        return $this->belongsTo('App\Models\Members\Students\Student', 'student_id');
    }
    
}
