<?php

use App\Http\Controllers\Api\ProductController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Auth\AuthController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\CartController;
use App\Http\Controllers\Api\OrderController;

Route::post('register', [AuthController::class, 'register'])->middleware('throttle:20,1');
Route::post('login', [AuthController::class, 'login'])->middleware('throttle:20,1')->name('login');
Route::get('profile', [AuthController::class, 'profile']);
Route::put('profile', [AuthController::class, 'updateProfile']);


Route::group(['middleware' => 'auth:api'], function () {
    Route::resource('categories', CategoryController::class);
    Route::resource('products', ProductController::class);
    Route::resource('orders', OrderController::class);

    Route::controller(CartController::class)->group(function () {
        Route::get('cart', 'index');
        Route::post('cart/add', 'addToCart');
        Route::put('cart/update', 'addToCart');
        Route::delete('cart/remove/{product}', 'removeFromCart');
        Route::delete('cart/clear', 'clearFromCart');
    });

});
