<?php

use App\Http\Controllers\Api\ProductController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Auth\AuthController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\CartController;

Route::post('register', [AuthController::class, 'register'])->middleware('throttle:225,1');
Route::post('login', [AuthController::class, 'login'])->middleware('throttle:225,1')->name('login');
Route::get('profile', [AuthController::class, 'profile'])->middleware('auth:api');
Route::put('profile', [AuthController::class, 'updateProfile'])->middleware('auth:api');


Route::group(['middleware' => 'auth:api'], function () {
    Route::resource('categories', CategoryController::class);
    Route::resource('products', ProductController::class);

    Route::controller(CartController::class)->group(function () {
        Route::get('cart', 'index');
        Route::post('cart/add', 'addToCart');
        Route::put('cart/update', 'addToCart');
        Route::delete('cart/remove/{product}', 'removeFromCart');
        Route::delete('cart/clear', 'clearFromCart');
    });

});
