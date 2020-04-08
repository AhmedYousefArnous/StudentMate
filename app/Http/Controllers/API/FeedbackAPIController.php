<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseAPIController;
use Validator;

use App\Models\Feedback;

class FeedbackAPIController extends BaseAPIController
{

        /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createFeedback(Request $request)
    {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
      
        $validator = Validator::make($request->all(),[
            'message'   => 'required',
        ]);

        if($validator->fails()) {
            return $this->sendError("Validation Failed", 200 ,$validator->errors());
        }
        $destinationPath = '';
        $filenameToStore = '';

        if($request->hasFile("media")) {
            $file = $request->file('media');
            
            $filenameWithExtension = $file->getClientOriginalName();

            $filename = pathinfo($filenameWithExtension, PATHINFO_FILENAME);

            $extension = $file->getClientOriginalExtension();

            $filenameToStore = $filename . '_' . time() . '_' . $extension;

            $destinationPath = 'public/feedback';

            $file->storeAs($destinationPath, $filenameToStore);
        }

        $feeback = Feedback::create([
            'message'       =>  $request->input('message'),
            'media'     =>   'feedback/' . $filenameToStore
        ]);

        $feeback->Student()->associate(auth()->user());
        $feeback->save();

        return $this->sendResponse($feeback, 'Feedback Created Successfully');
    }}
