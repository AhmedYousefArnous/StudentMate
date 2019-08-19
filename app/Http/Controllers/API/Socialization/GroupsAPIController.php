<?php
namespace App\Http\Controllers\API\Socialization;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseAPIController;
use Validator;
use App\Http\Resources\Socialization\groupFull as groupFullResource;

use App\Models\Members\Students\Socialization\Group;
use App\Models\Members\Students\Socialization\Conversation;
use App\Models\Members\Students\Student;

class GroupsAPIController extends BaseAPIController
{
    public function indexSubscribed(Request $request, $group_id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
        
        $group = Student::find(auth()->user()->id)->SubsribedGroups()->find($group_id);        
        
        if(!isset($group)) {
            return $this->sendError("Unauthorized Access", 401);            
        }

        return new groupFullResource($group);
    }

    public function indexManaged(Request $request, $group_id)
    {
        
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
        
        $group = Student::find(auth()->user()->id)->ManagedGroups()->find($group_id);
        
        if(!isset($group)) {
            return $this->sendError("Unauthorized Access", 401);            
        }

        return new groupFullResource($group);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
        
        $validator = Validator::make($request->all(),[
            'name' => 'required'
        ]);

        if($validator->fails()) {
            return $this->sendError("Validation Failed", 200, $validator->errors());
        }

        $group = group::create([
            'name'          =>  $request->name
        ]);

        $group->Creator()->associate(auth()->user());

        $group->Admins()->attach(auth()->user()->id);
        $group->Members()->attach(auth()->user()->id);
        $group->save();

        return $this->sendResponse(new groupFullResource($group) , 'group Created Successfully');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $group_id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $group_id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
        
        $validator = Validator::make($request->all(),[
            'name' => 'required'
        ]);

        if($validator->fails()) {
            return $this->sendError("Validation Failed", 200, $validator->errors());
        }

        $group = Student::find(auth()->user()->id)->ManagedGroups()->find($group_id);
        
        if(!isset($group)) {
            return $this->sendError("Group is Not Found");            
        }

        $group->name = $request->name;
        $group->save();

        return $this->sendResponse(new groupFullResource($group) , 'group Created Successfully');    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $group_id
     * @return \Illuminate\Http\Response
     */
    public function addStudents(Request $request, $group_id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
        
        $validator = Validator::make($request->all(),[
            'students_ids' => 'required'
        ]);

        if($validator->fails()) {
            return $this->sendError("Validation Failed", 200, $validator->errors());
        }

        $group = Student::find(auth()->user()->id)->ManagedGroups()->find($group_id);
        
        if(!isset($group)) {
            return $this->sendError("Unauthorized Access", 404);            
        }
        $ids = explode(',',$request->students_ids);

        
        
        foreach ($ids as $id) {
            $member = $group->Members()->find($id);
            if (!isset($member)){
                $group->Members()->attach($id);           
            } 
        }

        $group->save();        
        return $this->sendResponse(new groupFullResource($group) , 'group Created Successfully');    
    }


    public function removeStudents(Request $request, $group_id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
        
        $validator = Validator::make($request->all(),[
            'students_ids' => 'required'
        ]);

        if($validator->fails()) {
            return $this->sendError("Validation Failed", 200, $validator->errors());
        }

        $group = Student::find(auth()->user()->id)->ManagedGroups()->find($group_id);
        
        if(!isset($group)) {
            return $this->sendError("Unauthorized Access", 401);            
        }

        $ids = explode(',',$request->students_ids);

        foreach ($ids as $id) {
            $member = $group->Members()->find($id);
            
            if (isset($member)){
                $group->Members()->detach($id);           
            } 
        }

        $group->save();
        return $this->sendResponse(new groupFullResource($group) , 'group Created Successfully');    
    }


    public function leave(Request $request, $group_id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
        
        
        $group = Student::find(auth()->user()->id)->SubsribedGroups()->find($group_id);
        
        if(!isset($group)) {
            return $this->sendError("Unauthorized Access", 401);            
        }

        $group->Members()->detach(auth()->user()->id);

        $group->save();
        return $this->sendResponse(null , 'group has been leaved Successfully');    
    }


    public function addAdmins(Request $request, $group_id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
        
        $validator = Validator::make($request->all(),[
            'admins_ids' => 'required'
        ]);

        if($validator->fails()) {
            return $this->sendError("Validation Failed", 200, $validator->errors());
        }

        $group = Student::find(auth()->user()->id)->ManagedGroups()->find($group_id);
        
        if(!isset($group)) {
            return $this->sendError("Unauthorized Access", 401);            
        }

        $ids = explode(',',$request->admins_ids);


        foreach ($ids as $id) {
            $admin = $group->Admins()->find($id);
            
            if (!isset($admin)){
                $group->Admins()->attach($id);           
            } 
        }

        $group->save();
        return $this->sendResponse(new groupFullResource($group) , 'group Admins added Successfully');    
    }

    public function removeAdmins(Request $request, $group_id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
        
        $validator = Validator::make($request->all(),[
            'admins_ids' => 'required'
        ]);

        if($validator->fails()) {
            return $this->sendError("Validation Failed", 200, $validator->errors());
        }

        $group = Student::find(auth()->user()->id)->ManagedGroups()->find($group_id);
        
        if(!isset($group)) {
            return $this->sendError("Unauthorized Access", 401);            
        }

        $ids = explode(',',$request->admins_ids);


        foreach ($ids as $id) {
            $admin = $group->Admins()->find($id);
            
            if (isset($admin)){
                $group->Admins()->detach($id);           
            } 
        }

        $group->save();
        return $this->sendResponse(new groupFullResource($group) , 'group Admins added Successfully');    
    }

    public function addConversation(Request $request, $group_id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
        
        $validator = Validator::make($request->all(),[
            'conversation_name'   => 'required'
        ]);

        if($validator->fails()) {
            return $this->sendError("Validation Failed", 200, $validator->errors());
        }
        
        $group = Student::find(auth()->user()->id)->SubsribedGroups()->find($group_id);

        
        if(!isset($group)) {
            return $this->sendError("Unauthorized Access", 401);            
        }

        $conversation = Conversation::create([
            'name'          =>  $request->input('conversation_name'),
            'group_id'      =>  $group->id
        ]);
            
    
        return $this->sendResponse(new groupFullResource($group) , 'group Admins added Successfully');    
    }


    public function removeConversation(Request $request, $group_id, $conversation_id)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
        
        $group = Student::find(auth()->user()->id)->SubsribedGroups()->find($group_id);
        
        if(!isset($group)) {
            return $this->sendError("Unauthorized Access", 401);            
        }

        $conversation = Conversation::find($conversation_id);

        $conversation->group_id = null;
        $conversation->save();
        
        return $this->sendResponse(new groupFullResource($group) , 'group Admins added Successfully');    
    }
}
