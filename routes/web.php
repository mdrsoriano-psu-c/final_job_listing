<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\JobController;

Route::get('/', function () {
    return view('welcome');

Route::get('/jobs', [JobController::class, 'index']);
Route::get('/jobs/create', [JobController::class, 'create']);
Route::post('/jobs/store', [JobController::class, 'store']);

Route::get('/jobs/edit/{id}', [JobController::class, 'edit']);
Route::post('/jobs/update/{id}', [JobController::class, 'update']);

Route::get('/jobs/delete/{id}', [JobController::class, 'destroy']);


});
