<?php

namespace App\Http\Controllers\API\Socialization;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseAPIController;
use Validator;
use App\Models\Members\Students\Socialization\Conversation;
use App\Models\Members\Students\Socialization\Message;

class MessagesAPIController extends BaseAPIController
{

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
      
        $validator = Validator::make($request->all(),[
            'message'           => 'required',
            'conversation_id'   => 'required'
        ]);

        if($validator->fails()) {
            return $this->sendError("Validation Failed", $validator->errors());
        }
        
        $conversation = Conversation::find($request->input('conversation_id'));
        if (!isset($conversation)) {
            return $this->sendError("Conversation id is Not Found Failed");            
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
    public function delete(Request $request, $conversation_id, $message_id, $me)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
        
        $conversation = Conversation::find($conversation_id);
        
        
        if (!isset($conversation)) {
            return $this->sendError("Conversation Not Found. Incorrect data", 404);
        }
      
        $message = $conversation
                            ->Messages()
                            ->where('id',$message_id)
                            ->where('sender_id', auth()->user()->id)
                            ->first();

        if (!isset($message)) {
            return $this->sendError("Unauthorized Access. Incorrect data", 404);
        }
        if($me){
            $message->delete();
        } else {
            $message->delete_for_me = 1;
            $message->save();
        }
        return $this->sendResponse('Message Deleted Successfully');
        
    }

}
