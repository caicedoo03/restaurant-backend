<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\TableController;
use App\Http\Controllers\UserController;

Route::post('/login',[AuthController::class,'login']);
Route::post('/refresh',[AuthController::class,'refresh']);
Route::post('/logout',[AuthController::class,'logout']);

Route::middleware(['jwt.verify'])->group(function () {

    // CRUD EMPLOYEE
    Route::post('/registerEmployee',[EmployeeController::class,'register']);
    Route::post('/updateEmployee/{id}',[EmployeeController::class,'update']);
    Route::get('/searchEmployee',[EmployeeController::class,'search']);

    // CRUD USER
    Route::post('/registerUser',[UserController::class,'register']);
    Route::get('/searchUser',[UserController::class,'search']);

    // CRUD TABLE
    Route::post('/registerTable',[TableController::class,'register']);
    Route::post('/updateTable/{id}',[TableController::class,'update']);
    Route::get('/searchTable',[TableController::class,'search']);
});