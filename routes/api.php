<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Auth\AuthController;
use App\Http\Controllers\Api\CategoryController;

Route::post('register', [AuthController::class, 'register'])->middleware('throttle:225,1');
Route::post('login', [AuthController::class, 'login'])->middleware('throttle:225,1')->name('login');
Route::get('profile', [AuthController::class, 'profile'])->middleware('auth:api');
Route::put('profile', [AuthController::class, 'updateProfile'])->middleware('auth:api');


Route::group(['middleware' => 'auth:api'], function () {
    Route::resource('categories', CategoryController::class);
});
