<?php

namespace App\Http\Controllers\API\Socialization;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\API\BaseAPIController;
use Validator;
use DB;
use App\Http\Resources\Socialization\ConversationFull as ConversationFullResource;
use App\Models\Members\Students\Socialization\Conversation;
use App\Models\Members\Students\Student;

class ConversationsAPIController extends BaseAPIController
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
            'student_id'   => 'required'
        ]);

        if($validator->fails()) {
            return $this->sendError("Validation Failed", $validator->errors());
        }
        
        
        $conversation = Conversation::create([
            'name'     =>  $request->input('name'),
        ]);

        
        $conversation->Students()->attach(auth()->user());
        
        $student = Student::find($request->input('student_id'));
        $conversation->Students()->attach($student);
        
        $conversation->save();

        return $this->sendResponse($conversation, ' Message Created Successfully');

    }



    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $conversation_id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
      
        $conversation = Student::find(auth()->user()->id)->Conversations()->find($conversation_id);
      
        if (!isset($conversation)) {
            return $this->sendError("Conversation Not Found. Incorrect data", 404);
        }
      

        return new ConversationFullResource($conversation);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $conversation_id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
      
        
        $conversation = Student::find(auth()->user()->id)->Conversations()->find($conversation_id);
        // return $this->sendResponse($conversation, ' Message Created Successfully');

        if (!isset($conversation)) {
            return $this->sendError("Not Found", 404);
        }

        $conversation->name          =  $request->input('name');        
        $conversation->save();

        return $this->sendResponse($conversation, ' Message Created Successfully');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $converation_id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
      
        $converation = Student::find(auth()->user()->id)->Conversations()->find($converation_id);
        
        if (!isset($converation)) {
            return $this->sendError("Unauthorized Access 2", 401);
        }

        DB::table('conversations_students')
            ->where('conversation_id', $converation_id )
            ->where('student_id', auth()->user()->id)
            ->delete();
        
        return $this->sendResponse(null, 'Conversation Deleted Successfully');
    }

}
