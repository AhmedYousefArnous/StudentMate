<?php

namespace App\Http\Controllers\API\Socialization;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseAPIController;
use Validator;
use App\Models\Members\Students\Socialization\Conversation;
use App\Models\Members\Students\Socialization\Message;
use App\Models\Members\Students\Student;

class MessagesInGroupsAPIController extends BaseAPIController
{

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createMessage(Request $request, $group_id, $conversation_id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
      
        $group = Student::find(auth()->user()->id)->SubsribedGroups()->find($group_id);        
        
        if(!isset($group)) {
            return $this->sendError("Unauthorized Access to group", 401);            
        }
        
        $conversation = $group->Conversations()->find($conversation_id);
      
        if (!isset($conversation)) {
            return $this->sendError("Unauthorized Access to conversation", 401);            
        }  

      
        $validator = Validator::make($request->all(),[
            'message'           => 'required'
        ]);

        if($validator->fails()) {
            return $this->sendError("Validation Failed", 200, $validator->errors());
        }
        
        
        $message = Message::create([
            'message'          =>  $request->input('message'),
        ]);
        
        $message->Conversation()->associate($conversation);

        $message->Sender()->associate(auth()->user());

        $message->save();

        return $this->sendResponse($message, ' Message Created Successfully');


    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function deleteMessage(Request $request, $group_id, $conversation_id, $message_id, $me)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
      
        $group = Student::find(auth()->user()->id)->SubsribedGroups()->find($group_id);        
        
        if(!isset($group)) {
            return $this->sendError("Unauthorized Access to group", 401);            
        }
        
        $conversation = $group->Conversations()->find($conversation_id);
      
        if (!isset($conversation)) {
            return $this->sendError("Unauthorized Access to conversation", 401);            
        }  

      
        $message = $conversation
                            ->Messages()
                            ->where('id',$message_id)
                            ->where('sender_id', auth()->user()->id)
                            ->first();

        if (!isset($message)) {
            return $this->sendError("Unauthorized Access.", 401);
        }
        
        if($me){
            $message->delete();
        } else {
            $message->delete_for_me = 1;
            $message->save();
        }

        return $this->sendResponse(null, 'Message Deleted Successfully');        
    }

}
