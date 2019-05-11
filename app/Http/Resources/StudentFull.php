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
             "public" => require_once "StudentPublic.php",
             "private" => [
               $this->mergeWhen(auth()->user()->id === $this->id, [
                 'email'               => $this->email,
                 'card_id'             => $this->card_id,
                 'phone'               => $this->phone,
                 'joined'              => $this->created_at,
                 'updated'             => $this->updated_at,
                 // Relations
                 'enrolled_series' => Materials\Series::collection($this->Series),
                 'Conversations'   => Socialization\Conversation::collection($this->Conversations),
                 'Channels'   => Socialization\Channels::collection($this->Channels),
                 'groups' => [
                   'managed'   => new Socialization\Groups($this->ManagedGroups),
                   'subscribed'   => Socialization\Groups::collection($this->SubsribedGroups)
                   ],
                 'connections' => [
                   'send' => Socialization\Connections::collection(
                     $this->SendConnections()->where('accept', 0)->get()
                   ),

                   'reciever' =>  Socialization\Connections::collection(
                     $this->ReceivedConnections()->where('accept', 0)->get()
                   ),

                   'current' => [
                                 Socialization\Connections::collection(
                                     $this->SendConnections()->where([
                                       'accept'  => 1,
                                       'block'   => 0
                                       ])->get()
                                 ),
                                 Socialization\Connections::collection(
                                   $this->ReceivedConnections()->where([
                                     'accept'  => 1,
                                     'block'   => 0
                                     ])->get()
                                 ),
                               ],
                     'blocked' => Socialization\Connections::collection(
                       $this->BlockedConnections
                     ),
                   ],
               ])
             ]

         ];
     }
}
