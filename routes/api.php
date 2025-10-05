<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\RuanganController;
use App\Http\Controllers\Api\DokterController;
use App\Http\Controllers\Api\PasienController;

Route::middleware('api')->group(function () {
    Route::apiResource('ruangan', RuanganController::class);
    Route::apiResource('dokter', DokterController::class);
    Route::apiResource('pasien', PasienController::class);
});