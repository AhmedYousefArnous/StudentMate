<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\BaseController;

class BaseAPIController extends BaseController
{
    //
    public function sendResponse($data, $message = ""){

        $respose = [
            'success'   =>  true,
            'message'   => $message,
            'data'      => $data,
            'errors'    => null
        ];

        return response()->json($respose, 200);
    }


    public function sendError($error, $code = 404, $errorMessages = [] ) {
        $respose = [
            'success' => false,
            'message' => $error,
            'data'      => null,
            'errors'    => $errorMessages,
        ];

        if(!empty($errorMessages)) {
            $respose['errors'] = $errorMessages;
        }
        return response()->json($respose, $code);
    }

}
