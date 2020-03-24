<?php

namespace App\Http\Controllers\API\Socialization;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseAPIController;
use Validator;

use App\Http\Resources\Socialization\Channel as ChannelResource;
use App\Http\Resources\Socialization\ChannelFull as ChannelFullResource;

use App\Models\Members\Students\Socialization\Channel;
use App\Models\Members\Students\Student;

class ChannelAPIController extends BaseAPIController
{
 
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
      
        return ChannelResource::collection(Channel::all());
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
      
        return new ChannelFullResource(Channel::find($id));
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
      
        $validator = Validator::make($request->all(),[
            'name' => 'required'
        ]);

        if($validator->fails()) {
            return $this->sendError("Validation Failed", 200 ,$validator->errors());
        }

        $channel = Channel::create([
            'name'          =>  $request->input('name'),
            'description'   =>  $request->input('description')
        ]);

        $channel->Creator()->associate(auth()->user());

        $channel->Admins()->attach(auth()->user()->id);
        $channel->Subscribers()->attach(auth()->user()->id);
        $channel->save();

        return $this->sendResponse($channel, 'Channel Created Successfully');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
      
        $channel = Student::find(auth()->user()->id)->ManagedChannels()->find($id);

        if (!isset($channel) ) {
            return $this->sendError("Not Found");
        }

        $validator = Validator::make($request->all(),[
            'name' => 'required'
        ]);

        if($validator->fails()) {
            return $this->sendError("Validation Failed", 200, $validator->errors());
        }

        $channel->name          =  $request->input('name');
        $channel->description   =  $request->input('description');

        $channel->save();

        return $this->sendResponse($channel, 'Channel Updated Successfully');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
      
        $channel = Student::find(auth()->user()->id)->ManagedChannels()->find($id);
        
        if (!isset($channel)) {
            return $this->sendError("Not Found");
        }
      
        $channel->delete();
        return $this->sendResponse(null, 'Channel Deleted Successfully');
    }


    public function subscribe(Request $request, $id) {
        
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
        
        $student = Student::find(auth()->user()->id);
        $channel = Channel::find($id);
        

        if (isset($channel) && $student->SubscribedChannels()->find($channel->id) === null) {
            $student->SubscribedChannels()->attach($channel);
            $student->save();    
            return $this->sendResponse(null, 'Channel Subcribed Successfully');        
        }

        return $this->sendError("Not Found");
         
    }

    public function unSubscribe(Request $request, $id) {
        
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
        
        $student = Student::find(auth()->user()->id);
        $channel = Channel::find($id);
        

        if (isset($channel) && $student->SubscribedChannels()->find($channel->id) !== null) {
            $student->SubscribedChannels()->detach($channel);
            $student->save();    
            return $this->sendResponse(null, 'Channel unSubscribed Successfully');        
        }

        return $this->sendError("Not Found");

    }

    public function makeAdmin(Request $request, $channel_id, $student_id) {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
        
        $logged_student = Student::find(auth()->user()->id);
        $admin_student = Student::find($student_id);
        $channel = Channel::find($channel_id);
        

        if (!isset($channel) || !isset($admin_student) )
        {
            return $this->sendError("Not Found");
        }

        if (
            $logged_student->ManagedChannels()->find($channel->id) !== null && 
            $admin_student->ManagedChannels()->find($channel->id) === null ) 
        {
            $channel->Admins()->attach($admin_student);           
            return $this->sendResponse(null, $admin_student->username . ' is now admin Successfully');        
        }

        return $this->sendError("Unauthorized Access", 401);

    }

    public function removeAdmin(Request $request, $channel_id, $student_id) {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
        
        $logged_student = Student::find(auth()->user()->id);
        $admin_student = Student::find($student_id);
        $channel = Channel::find($channel_id);
        

        if (!isset($channel) || !isset($admin_student) )
        {
            return $this->sendError("Not Found");
        }

        if (
            $logged_student->ManagedChannels()->find($channel->id) !== null && 
            $admin_student->ManagedChannels()->find($channel->id) !== null ) 
        {
            $channel->Admins()->detach($admin_student);           
            return $this->sendResponse(null, $admin_student->username . ' removed from admins Successfully');        
        }

        return $this->sendError("Unauthorized Access", 401);

    }
}
