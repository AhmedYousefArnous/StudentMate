<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers;
class BaseAPIController extends BaseController
{
    //
    public function sendResponse($result, $message = ""){

        $respose = [
            'success' =>  true,
            'data' => $result,
            'message' => $message
        ];

        return response()->json($respose, 200);
    }


    public function sendError($error, $code = 404, $errorMessages = [] ) {
        $respose = [
            'success' => false,
            'message' => $error
        ];

        if(!empty($errorMessages)) {
            $respose['errors'] = $errorMessages;
        }
        return response()->json($respose, $code);
    }

}
