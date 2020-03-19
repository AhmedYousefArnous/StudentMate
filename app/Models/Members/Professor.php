<?php

namespace App\Models\Members;

use Illuminate\Database\Eloquent\Model;


class Professor extends Model
{
    protected $hidden = [
        'password', 'remember_token',
    ];
}
