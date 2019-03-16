<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Student extends JsonResource
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
            'id'              => $this->id,
            'name'            => $this->username,
            'name_arabic'     => $this->fullname_ar,
            'profile_picture' => $this->profile_picture,
            'university'      => new Structure\University($this->University),
            'faculty'         => new Structure\Faculty($this->Faculty),
            'department'      => new Structure\Department($this->Department),
            'section'         => new Structure\Section($this->Section),
            'level'           => new Structure\Level($this->Level),
            'gender'          => $this->gender,
            'nationality'     => $this->nationality,

            $this->mergeWhen(auth()->user()->id === $this->id, [
              'enrolled_series' => Materials\Series::collection($this->Series),
              'Conversations'   => Socialization\Conversation::collection($this->Conversations),
              'Channels'   => Socialization\Channels::collection($this->Channels),
              'groups' => [
                'managed'   => new Socialization\GroupsCollection($this->ManagedGroups),
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
                ]
              'email'               => $this->email,
              'cover_image'         => $this->cover_image,
              'birthdate'           => $this->birthdate,
              'card_id'             => $this->card_id,
              'account_activation'  => $this->account_activation,
              'phone'               => $this->phone,
              'joined'              => $this->created_at,
              'updated'             => $this->updated_at,
            ])

        ];
    }
}
