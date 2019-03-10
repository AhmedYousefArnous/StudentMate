<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\APIController;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Events\BreadDataAdded;
use TCG\Voyager\Models\DataType;
use TCG\Voyager\Database\Schema\SchemaManager;
use App\Models\Student;

class StudentProfileController extends APIController
{


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

    public function profile(Request $request) {


        if(!$request->expectsJson()) {
            return $this->sendError("Unauthorized", 401);
        }



        $dataType = Voyager::model('DataType')->where('slug', '=', 'students')->first();




        $model = app($dataType->model_name);

        $dataWithoutRelations = call_user_func([$model, 'find'], auth()->user()->id);


        $relations = $this->getRelationships($dataType);


        foreach ($dataWithoutRelations as $pieceDataWithoutRelations) {
            $data =
                [
                   'content'   => $dataWithoutRelations,
                   'relations' => $this->getRelaionInfo($dataWithoutRelations, $relations)
                ];
        }

        // Check if BREAD is Translatable
        // $isModelTranslatable = is_bread_translatable($dataWithoutRelations);

        //   return $this->sendResponse($relations);

        return $this->sendResponse($data);

    }


}
