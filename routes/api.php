<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\SliderController;
use App\Http\Controllers\SubcategoryController;
use App\Http\Controllers\TestimoniController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::group([

    'middleware' => 'api',
    'prefix' => 'auth'

], function () {

    Route::post('admin',[AuthController::class, 'login']);
    Route::post('register',[AuthController::class, 'register']);
    Route::post('logout',[AuthController::class, 'logout']);
    

});

Route::group(['middleware' => 'api'], function () {
    // Menggunakan Route::resource dengan nama resource 'categories' dan controller CategoryController
    Route::resource('categories', CategoryController::class);
    
    // Menggunakan Route::resource dengan nama resource 'subcategories' dan controller SubcategoryController
    Route::resource('subcategories', SubcategoryController::class);

    Route::resource('slider', SliderController::class);
    Route::resource('product', ProductController::class);
    Route::resource('member', MemberController::class);
    Route::resource('testimoni', TestimoniController::class);
    Route::resource('review', ReviewController::class);
    Route::resource('order', OrderController::class);
    Route::resource('payment', PaymentController::class);
    Route::get('reports', [ReportController::class, 'index']);
    Route::get('pesanan/baru', [OrderController::class, 'baru']);
    Route::get('pesanan/dikonfirmasi', [OrderController::class, 'dikonfirmasi']);
    Route::get('pesanan/dikemas', [OrderController::class, 'dikemas']);
    Route::get('pesanan/dikirim', [OrderController::class, 'dikirim']);
    Route::get('pesanan/diterima', [OrderController::class, 'diterima']);
    Route::get('pesanan/selesai', [OrderController::class, 'selesai']);
    Route::post('pesanan/ubah_status/{order}', [OrderController::class, 'ubah_status']);
    
    Route::get('report', [ReportController::class, 'get_report']);
});

// routes/api.php

Route::group(['middleware' => 'auth:api'], function () {
    // Rute yang memerlukan otentikasi
    Route::get('/protected-route', [AuthControllerController::class, 'protectedMethod']);
});
