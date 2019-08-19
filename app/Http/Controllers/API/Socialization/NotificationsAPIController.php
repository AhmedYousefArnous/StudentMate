<?php

namespace App\Http\Controllers\API\Socialization;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseAPIController;
use Validator;
use App\Http\Resources\Socialization\Notification as NotificationResource;

use App\Models\Members\Students\Socialization\Channel;
use App\Models\Members\Students\Socialization\ChannelsNotification;
use App\Models\Members\Students\Student;

class NotificationsAPIController extends BaseAPIController
{
    

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function addNotification(Request $request, $channel_id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
        
        $validator = Validator::make($request->all(),[
            'content'   => 'required'
        ]);

        if($validator->fails()) {
            return $this->sendError("Validation Failed", $validator->errors());
        }   

        $channel = Student::find(auth()->user()->id)->ManagedChannels()->find($channel_id);

        if(!isset($channel)) {
            return $this->sendError("Unauthorized Access", 401);            
        }

        $notification = ChannelsNotification::create([
            'content'       => $request->content,
            'creator_id'    => auth()->user()->id,
            'channel_id'    => $channel->id
        ]);


        return $this->sendResponse(new NotificationResource($notification) , 'Notification Created Successfully');


    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateNotification(Request $request, $channel_id, $notification_id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
        
        $validator = Validator::make($request->all(),[
            'content'   => 'required'
        ]);

        if($validator->fails()) {
            return $this->sendError("Validation Failed", $validator->errors());
        }   

        $channel = Student::find(auth()->user()->id)
                    ->ManagedChannels()->find($channel_id);

        if(!isset($channel)) {
            return $this->sendError("Unauthorized Access", 401);            
        }
            
        $notification = $channel->Notifications()->find($notification_id);

        if(!isset($notification)) {
            return $this->sendError("Unauthorized Access", 401);            
        }

        $notification->content = $request->content;
        $notification->save();

        return $this->sendResponse(new NotificationResource($notification) , 'Notification Updated Successfully');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function deleteNotification(Request $request, $channel_id, $notification_id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
        
        $channel = Student::find(auth()->user()->id)
                    ->ManagedChannels()->find($channel_id);

        if(!isset($channel)) {
            return $this->sendError("Unauthorized Access", 401);            
        }
            
        $notification = $channel->Notifications()->find($notification_id);

        if(!isset($notification)) {
            return $this->sendError("Unauthorized Access", 401);            
        }

        $notification->delete();

        return $this->sendResponse(null , 'Notification Deleted Successfully');
    }


}
