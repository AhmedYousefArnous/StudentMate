<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use \TCG\Voyager\Http\Controllers\VoyagerBaseController;

class Controller extends VoyagerBaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
}
