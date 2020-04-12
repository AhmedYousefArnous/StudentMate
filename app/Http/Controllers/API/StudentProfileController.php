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
use App\Http\Resources\Student as StudentResource;
use App\Models\Structure\University;

class StudentProfileController extends APIController
{

    protected $inputs = [];
    protected $checks = [];
    protected $paginate_number = 20;

    public function register(Request $request) {

        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }

        $slug = 'students';

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug )->first();

        


        // Validate fields
        $val = $this->validateBread($request->all(), $dataType->addRows);

        if ($val->fails()) {
            return $this->sendError("Validation Falid", 200, $val->messages() );
        }

        $this->inputs = $request->all();
        $this->optionalValidation('email', ['unique:students', 'string', 'email', 'max:255'] );
        
        if(!empty($this->checks)) {
            return  $this->sendError("Validation Failed", 200 ,$this->checks);
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

        if(isset($this->inputs['username'])) {
            $this->optionalValidation('username', ['string', 'max:255'] );
            $student->username  = $this->inputs['username'];
        }


        if(isset($this->inputs['email'])) {
            $this->optionalValidation('email', ['unique:students', 'string', 'email', 'max:255'] );
            $student->email  = $this->inputs['email'];
        }

        if(isset($this->inputs['password'])) {
            $this->optionalValidation('password', ['string', 'min:8'] );
            $this->inputs['password'] = Hash::make($this->inputs['password']);
            $student->password  = $this->inputs['password'];
        }

        if(isset($this->inputs['phone'])) {
            $this->optionalValidation('phone', ['string', 'max:20'] );
            $student->phone  = $this->inputs['phone'];
        }
        if(isset($this->inputs['is_first_login'])) {
            $this->optionalValidation('is_first_login', ['Boolean'] );
            $student->is_first_login  = $this->inputs['is_first_login'];
        }


        if(!empty($this->checks)) {
          return  $this->sendError("Validation Failed", 200 ,$this->checks);
        }
        $student->save();

        return $this->sendResponse(null, 'Student Data Updated Successfully');

    }
    
    public function updateProfileOptions(Request $request) {

        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }

        $student = Student::find(auth()->user()->id);

        $student->options     = json_encode($request->all());

        $student->save();
        return $this->sendResponse($student, 'Student Data Updated Successfully');

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
            'gender'            => ['required'],
            'nationality'       => ['required']
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
        $student->nationality       = $input['nationality'];


        $student->save();
        $student->options = json_decode($student->options);
        return $this->sendResponse($student, 'Student Data Updated Successfully');

    }

    public function firstProfileContent(Request $request) {
    
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
      
        return $this->sendResponse(UniversityFullResource::collection(University::all()));    
    }

    public function search(Request $request) {
        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }
      
        $dataType = Voyager::model('DataType')->where('slug','=' ,'students')->first();
      
      
        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);
            $searchable = false;

    
            // Order Params
            $order_by = (isset($request->order_by) && in_array($request->order_by, $dataType->fields()))
                                ?  $request->order_by : $dataType->order_column;
    
            $order_direction = isset($request->order_direction)
                                ?  $request->order_direction : "desc";
    
    
            // Search Params
            $search_value     = '';
            $search_filter    = '';
    
            if ($request->search && $request->key && $request->filter) {
            $search_filter = ($request->filter == 'equals') ? '=' : 'LIKE';
            $search_value = ($request->filter == 'equals') ? $request->search : '%'.$request->search.'%';
            $searchable = true;
            }
    
            if($searchable) {
            $dataWithoutRelations =
                $model::where($request->key, $search_filter, $search_value)
                            ->orderBy($order_by, $order_direction)
                            ->paginate($this->paginate_number);
    
            } else {
                $dataWithoutRelations =
                $model::orderBy($order_by, $order_direction)
                            ->paginate($this->paginate_number);
            }
    
        
        } else {
            $dataWithoutRelations = DB::table($dataType->name)->all();
        }
    
        return $this->sendResponse(StudentResource::collection($dataWithoutRelations));
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
