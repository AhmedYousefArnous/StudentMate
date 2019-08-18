<?php

namespace App\Http\Controllers\API\Socialization;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseAPIController;
use DB;

use App\Models\Members\Students\Socialization\Connection;
use App\Models\Members\Students\Student;

class ConnectionsAPIController extends BaseAPIController
{

    
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request) {

        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
      
        $student = Student::find($request->reciever_id);
        
        if(auth()->user()->id == $request->reciever_id) {
            return $this->sendError("You Can't Send a connection request to yourself!");
        }
  
        $connection = Connection::
                                 where(
                                    [
                                        ['reciever_id' , '=',  $request->reciever_id],
                                        ['sender_id' , '=',  auth()->user()->id],
                                    ])
                                 ->orWhere(
                                    [
                                        ['reciever_id' , '=',   auth()->user()->id],
                                        ['sender_id' , '=',  $request->reciever_id],
                                    ])
                                 ->first();
  
        if (isset($connection)) {
            return $this->sendError("Connection Request have been already sent");
        }

        if (!isset($student)) {
          return $this->sendError("Student account isn't found");
        }
  
        $connection = $student->ReceivedConnections()
                                            ->create([
                                                'sender_id' => auth()->user()->id
                                            ]);
      
        return $this->sendResponse($connection, 'Connection created Successfully');
  
      }
  

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    // public function store(Request $request)
    // {
    //     //
    // }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $connection_id
     * @return \Illuminate\Http\Response
     */
    // public function update(Request $request, $connection_id)
    // {
    //     //
    // }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $connection_id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $connection_id)
    {

        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
      
        
        $connection =  DB::table('connections')
                                ->where(
                                    [
                                        ['id', $connection_id],
                                        ['blocker_id' , '=',  null],                                    
                                        ['sender_id' , '=',  auth()->user()->id],
                                    ])
                                    ->orWhere(
                                    [
                                        ['id', $connection_id],                                    
                                        ['blocker_id' , '=',  null],
                                        ['reciever_id' , '=',   auth()->user()->id],
                                    ])
                                ->delete();


      if (!$connection) {
        return $this->sendError("Connection isn't found");
      }

      return $this->sendResponse(null, 'Connection deleted Successfully');

    }


    public function accept(Request $request, $connection_id) {
      
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }
      
        $connection = Student::find(auth()->user()->id)->ReceivedConnections()->find($connection_id);
        

        if (!isset($connection)) {
          return $this->sendError("Connection isn't found");
        }
  
        if ($connection->accept) {
          return $this->sendError("Connection is already accepted");
        }
  
        $connection->accept = true;
        $connection->save();
        
        return $this->sendResponse($connection, 'Connection Accepted Successfully');
    }



    public function block(Request $request,$connection_id) {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }

        $connection = Student::find(auth()->user()->id)->Friends($connection_id);
    
        if (!isset($connection)) {
          return $this->sendError("Connection isn't found");
        }

        $connection = Connection::find($connection->id);
        
        $connection->block = true;
        $connection->blocker_id = auth()->user()->id;

        $connection->save();
  
  
        return $this->sendResponse($connection, 'Student is blocked Successfully');
  
    }
  
    public function unblock(Request $request,$connection_id) {
        
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized Access", 401);
        }

        $connection = Student::find(auth()->user()->id)->BlockedConnections()->find($connection_id);
    
        if (!isset($connection)) {
          return $this->sendError("Connection isn't found");
        }

        
        $connection->block = false;
        $connection->blocker_id = null;

        $connection->save();
  
  
        return $this->sendResponse($connection, 'Student is blocked Successfully');
  
    }
  
  
}
