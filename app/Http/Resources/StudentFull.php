<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class StudentFull extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
     public function toArray($request)
     {
         return [
              // "public" => require_once "StudentPublic.php",
               $this->mergeWhen(auth()->user()->id === $this->id, [
                'id'              => $this->id ,
                'joined'          => $this->created_at,
                'name'            => $this->username  ,
                'name_arabic'     => $this->username_ar ,
                'university'      => new Structure\University($this->University),
                'faculty'         => new Structure\Faculty($this->Faculty) ,
                'department'      => new Structure\Department($this->Department) ,
                'level'           => new Structure\Level($this->Level) ,
                'section'         => $this->section ,
                'term'            => $this->term ? 'Second' : 'First', 
                'gender'          => $this->gender ? 'Male' : 'Famale',
                'email'           => $this->email ,
                'is_first_login'  => $this->is_first_login ,
                'phone'           => $this->phone  ,
                'card_id'         => $this->card_id,
                'updated'         => $this->updated_at,
                'nationality'      => $this->nationality,
                'options'         => json_decode($this->options),
                 // Relations
                 'enrolled_series' => Materials\Series::collection($this->Series),
                 'Conversations'   => Socialization\Conversation::collection($this->Conversations),
                 'Channels' => [
                  'managed'   => Socialization\Channel::collection($this->ManagedChannels),
                  'subscribed'   => Socialization\Channel::collection($this->SubscribedChannels),
                  ],
                 'groups' => [
                   'managed'      => Socialization\Group::collection($this->ManagedGroups),
                   'subscribed'   => Socialization\Group::collection($this->SubsribedGroups)
                   ],
                 'connections' => [
                   'send'       => Socialization\Connections::collection( $this->SendConnections ),
                   'reciever'   =>  Socialization\Connections::collection( $this->ReceivedConnections ),
                   'current'    => [  
                       Socialization\Connections::collection( $this->FriendsWithISendConnection ),
                       Socialization\Connections::collection( $this->FriendsWithIRecievedConnection )
                    ],
                   'blocked'    => Socialization\Connections::collection( $this->BlockedConnections ),
                   ],
               ])

         ];
     }
}
