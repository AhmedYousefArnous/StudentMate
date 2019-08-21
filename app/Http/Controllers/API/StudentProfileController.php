<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\APIController;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Events\BreadDataAdded;
use TCG\Voyager\Models\DataType;
use Illuminate\Support\Facades\Hash;
use TCG\Voyager\Database\Schema\SchemaManager;
use App\Models\Members\Students\Student;
use Validator;

use App\Http\Resources\Structure\UniversityFull as UniversityFullResource;
use App\Models\Structure\University;

class StudentProfileController extends APIController
{

    protected $inputs = [];
    protected $checks = [];

    public function register(Request $request) {

        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }

        $slug = 'students';

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug )->first();



        // Validate fields with ajax
        $val = $this->validateBread($request->all(), $dataType->addRows);

        if ($val->fails()) {
            return $this->sendError("Validation Falid", 200, $val->messages() );
        }


        if (!$request->has('_validate')) {
            $data = $this->insertUpdateData($request, $slug, $dataType->addRows, new $dataType->model_name());

            event(new BreadDataAdded($dataType, $data));

            return $this->sendResponse(null, "Student Created Successfully");
        }


    }

    public function updateProfile(Request $request) {


        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }

        $this->inputs = $request->all();
        $student = Student::find(auth()->user()->id);

        if(!empty($this->inputs['username'])) {
            $this->optionalValidation('username', ['string', 'max:255'] );
            $student->username  = $this->inputs['username'];
        }


        if(!empty($this->inputs['email'])) {
            $this->optionalValidation('email', ['unique:students', 'string', 'email', 'max:255'] );
            $student->email  = $this->inputs['email'];
        }

        if(!empty($this->inputs['password'])) {
            $this->optionalValidation('password', ['string', 'min:8'] );
            $this->inputs['password'] = Hash::make($this->inputs['password']);
            $student->password  = $this->inputs['password'];
        }

        if(!empty($this->inputs['phone'])) {
            $this->optionalValidation('phone', ['string', 'max:20'] );
            $student->phone  = $this->inputs['phone'];
        }

        if(!empty($this->checks)) {
          return  $this->sendError("Validation Failed", 200 ,$this->checks);
        }
        $student->save();

        return $this->sendResponse(null, 'Student Data Updated Successfully');

    }


    public function firstProfile(Request $request) {

        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }

        $validator = Validator::make($request->all(),[
            'university_id' => ['required'],
            'faculty_id' => ['required'],
            'department_id' => ['required'],
            'section' => ['required'],
            'level_id' => ['required'],
            'term' => ['required'],
            'card_id' => ['required'],
            'username_ar' => ['required'],
            'gender' => ['required'],
        ]);

        if($validator->fails()) {
            return $this->sendError("Validation Failed", 200, $validator->errors());
        }


        $input = $request->all();
        $student = Student::find(auth()->user()->id);


        $student->university_id     = $input['university_id'];
        $student->faculty_id        = $input['faculty_id'];
        $student->department_id     = $input['department_id'];
        $student->section           = $input['section'];
        $student->card_id           = $input['card_id'];
        $student->username_ar       = $input['username_ar'];
        $student->level_id          = $input['level_id'];
        $student->gender            = $input['gender'];
        $student->term              = $input['term'];


        $student->save();

        return $this->sendResponse(null, 'Student Data Updated Successfully');

    }

    public function firstProfileContent(Request $request) {
    
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
      
        return $this->sendResponse(UniversityFullResource::collection(University::all()));    
    }
    
    public function optionalValidation($column , $constraints) {
        $validator = Validator::make($this->inputs,[
            $column    => $constraints
        ]);

        if ($validator->fails()) {
            $this->checks[] = $validator->errors();
        }
    }
}
