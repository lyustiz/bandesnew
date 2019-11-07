<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

require base_path("routes/api/controlPerceptivo.php");
require base_path("routes/api/dicom.php");
require base_path("routes/api/facturero.php");
require base_path("routes/api/fas.php");
require base_path("routes/api/general.php");