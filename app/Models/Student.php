<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;

class Student extends \TCG\Voyager\Models\User
{
    use Notifiable, HasApiTokens;

    // public function series() {
    //     return $this->belongsToMany('App\Models\Series');
    // }   
}
