<?php

namespace App\Models\Members\Students\Socialization;

use Illuminate\Database\Eloquent\Model;


class Message extends Model
{
    protected $fillable = [
        'message' , 'conversation_id'
      ];
  

     // belongsTo Relations
    public function Sender() {
        return $this->belongsTo('App\Models\Members\Students\Student', 'sender_id');
    }
    
    public function Conversation() {
        return $this->belongsTo('App\Models\Members\Students\Socialization\Conversation');
    }
    
}
