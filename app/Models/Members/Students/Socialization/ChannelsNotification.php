<?php


namespace App\Models\Members\Students\Socialization;

use Illuminate\Database\Eloquent\Model;


class ChannelsNotification extends Model
{
    public function Channel() {
        return $this->belongsTo('App\Models\Members\Students\Socialization\Channel');
    }
}
