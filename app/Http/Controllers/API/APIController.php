<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use \App\Http\Controllers\API\BaseAPIController;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Models\DataType;
use TCG\Voyager\Database\Schema\SchemaManager;

class APIController extends BaseAPIController
{
  protected $haystack = [
    // E-Learning Structure
    'categories',
    // E-Learning Members
    'students',
    // Materials
    'series',
    'lectures',
      'handwritings',
      'sections',
    'parts',
    'exams',
    'books',
    'recommendations'
    // Socialization

  ];


  protected $paginate_number = 20;

      //***************************************
      //               ____
      //              |  _ \
      //              | |_) |
      //              |  _ <
      //              | |_) |
      //              |____/
      //
      //      Browse our Data Type (B)READ
      //
      //****************************************

  public function index(Request $request)
  {

    if(!$request->expectsJson()) {
      return $this->sendError("Unauthorized", 401);
    }

    if (!in_array($request->slug, $this->haystack) ) {
      return $this->sendError("Unauthorized", 401);
    }


    $dataType = Voyager::model('DataType')->where('slug', '=', $request->slug)->first();


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
        // If Model doest exist, get data from table name
        $dataWithoutRelations = DB::table($dataType->name)->all();
    }


    // Check if BREAD is Translatable
    // if (($isModelTranslatable = is_bread_translatable($model))) {
    //     $dataTypeContent->load('translations');
    // }

    return $this->sendResponse($dataWithoutRelations);
  }


      //***************************************
      //                _____
      //               |  __ \
      //               | |__) |
      //               |  _  /
      //               | | \ \
      //               |_|  \_\
      //
      //  Read an item of our Data Type B(R)EAD
      //
      //****************************************

      public function show(Request $request, $id)
      {

        if(!$request->expectsJson()) {
          return $this->sendError("Unauthorized", 401);
        }


        if (!in_array($request->slug, $this->haystack) ) {
          return $this->sendError("Unauthorized", 401);
        }

        $dataType = Voyager::model('DataType')->where('slug', '=', $request->slug)->first();




        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);
            $dataWithoutRelations = call_user_func([$model, 'find'], $request->id);

            if(!$dataWithoutRelations) {
              return $this->sendError("Not Found", 404);
            }

        } else {
            // If Model doest exist, get data from table name
            $dataWithoutRelations = DB::table($dataType->name)->all();
        }


        $relations = $this->getRelationships($dataType);


        foreach ($dataWithoutRelations as $pieceDataWithoutRelations) {
          $data =
            [
              'content'   => $dataWithoutRelations,
              'relations' => $this->getRelaionInfo($dataWithoutRelations, $relations, $request->slug)
            ];
        }

        // Check if BREAD is Translatable
        // $isModelTranslatable = is_bread_translatable($dataWithoutRelations);

        // return $this->sendResponse($relations);

        return $this->sendResponse($data);

  }

  public function getRelationships(DataType $dataType)
  {
      $relations = [];
      foreach ($dataType->readRows as  $row) {
          if ($row->type == 'relationship') {
                $relations[] = $row;
          }
      }
      return $relations;
  }

  public function getRelaionInfo($pieceDataWithoutRelations, $relations, $slug = '') {
    $relationDescriptions = null;
    foreach ($relations as  $relation) {
      $model    = $relation->details->model;
      $attacher = $relation->details->column;
      $pointed_table = 'series';

      switch ($relation->details->type) {
        case 'belongsTo':
          // code...

          $relationDescriptions [] = [
              'details'  => [
                'display_name'    => $relation->display_name,
                'relation_type'   => $relation->details->type
              ],
              'attacher' =>  $model::find($pieceDataWithoutRelations->{$attacher})
            ];
          break;

        case 'hasMany':

          $relationDescriptions [] = [
              'details'  => [
                'display_name'    => $relation->display_name,
                'relation_type'   => $relation->details->type
              ],
              'attacher' =>  $model::where($attacher, $pieceDataWithoutRelations->id)->get()
            ];
          break;

        case 'hasOne':
          // code...
          break;

        case 'belongsToMany':
          if($relation == null) break;
          $relationDescriptions [] = [
            'details'  => [
              'display_name'    => $relation->display_name,
              'relation_type'   => $relation->details->type
            ],
            'attacher' =>  $model::where($attacher, $pieceDataWithoutRelations->id)->get()

            // 'attacher' =>
            //             DB::table('student_assign_series')
            //               ->leftJoin('series', 'series.id', 'student_assign_series.series_id')
            //               ->where('student_assign_series.student_id', 18)
            //               ->get()
                        // :
                        // DB::table('student_assign_series')
                        //   ->leftJoin('students', 'students.id', 'student_assign_series.student_id')
                        //   ->where('student_assign_series.series_id', 18)
                        //   ->get()
              // 'attacher' =>  $pointed_table == 'series' ?
              //                       DB::table('student_assign_series')
              //                         ->leftJoin('series', 'series.id', 'student_assign_series.series_id')
              //                         ->where('student_assign_series.student_id', 18)
              //                         ->get()
              //                       :
              //                     DB::table('student_assign_series')
              //                       ->leftJoin('students', 'students.id', 'student_assign_series.student_id')
              //                       ->where('student_assign_series.series_id', 18)
              //                       ->get()

            // 'attacher' => $this->getbelongsToManyRelations(
            //                           $relation->detials->pivot_table,
            //                           $relation->detials->table,
            //                           18
            //                           )
          ];
        break;
       }
    }
    return $relationDescriptions;
  }

  public function getbelongsToManyRelations($pivot_table,$pointed_table, $pointer_id) {
    $query = null;

    switch($pivot_table) {
      case 'student_assign_series':
        if($pointed_table == 'series') {
            $query = DB::table('student_assign_series')
              ->leftJoin('series', 'series.id', 'student_assign_series.series_id')
              ->where('student_assign_series.student_id', $pointer_id)
              ->get();
        } else {
          $query = DB::table('student_assign_series')
            ->leftJoin('students', 'students.id', 'student_assign_series.student_id')
            ->where('student_assign_series.series_id', $pointer_id)
            ->get();
        }
        break;


      default:
        $query = null;
        break;
    }

    return $query;
  }
}
