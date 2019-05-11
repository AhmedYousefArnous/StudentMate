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
use App\Models\Student;
use Validator;

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
            return $this->sendError($val->messages());
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
          return  $this->sendError("Validation Failed", $this->checks);
        }
        $student->save();

        return $this->sendResponse(true, 'Student Data Updated Successfully');

    }


      public function firstProfile(Request $request) {
        
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
