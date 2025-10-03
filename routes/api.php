<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\RuanganController;

Route::middleware('api')->group(function () {
    Route::apiResource('ruangan', RuanganController::class);
});