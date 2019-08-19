<?php


namespace App\Models\Members\Students\Socialization;

use Illuminate\Database\Eloquent\Model;


class ChannelsNotification extends Model
{
    protected $fillable = [
        'content', 'creator_id', 'channel_id'
    ];
    public function Channel() {
        return $this->belongsTo('App\Models\Members\Students\Socialization\Channel');
    }
}
