<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\EquipmentController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\HouseController;
use App\Http\Controllers\ServiceController;
use App\Http\Controllers\VisitorController;
use App\Http\Controllers\TransactionController;
use App\Http\Controllers\NotificationController;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => 'auth:api', "prefix" => "v1"], function () {
    Route::group(["prefix" => "auth"], function() {
        Route::post("email", [AuthController::class, "email"])->withoutMiddleware("auth:api");
        Route::post('login', [AuthController::class, "login"])->withoutMiddleware("auth:api");
        Route::post('verify', [AuthController::class, "verify"]);
        Route::post('resend-otp', [AuthController::class, "resendOTP"]);
        Route::post('register', [AuthController::class, "createAccount"])->withoutMiddleware("auth:api");
        Route::get('logout', [AuthController::class, "logout"]);
        Route::get('refresh', [AuthController::class, "refresh"]);
        Route::get('me', [AuthController::class, "me"]);
    });

    Route::group(["prefix" => "account"], function (){
        Route::post('update-profile',[UserController::class, "updateProfile"]);
        Route::post("change-password", [UserController::class, "changePassword"]);
        Route::post("role", [UserController::class, "updateRole"]);
        Route::post("update-account-status", [UserController::class, "updateAccountStatus"]);
    });

    Route::group(["prefix" => "houses"], function () {
        Route::get("", [HouseController::class, "houses"]);
        Route::post("select", [HouseController::class, "selectHouse"]);
        Route::post("update-status", [HouseController::class, "updateStatus"]);
    });

    Route::group(["prefix" => "notifications"], function() {
        Route::get("", [NotificationController::class, "notification"]);
        Route::get("read/{id}", [NotificationController::class, "read"]);
    });

    Route::group(["prefix" => "transactions"], function() {
        Route::get("", [TransactionController::class, "transactions"])->withoutMiddleware("auth:api");
    });

    Route::group(["prefix" => "services"], function(){
        Route::get("", [ServiceController::class, "services"]);
        Route::post("create", [ServiceController::class, "create"]);
        Route::put("update/{id}", [ServiceController::class, "update"]);
        Route::put("update-status/{id}", [ServiceController::class, "updateStatus"]);
        Route::delete("delete/{id}", [ServiceController::class, "delete"]);
        Route::group(["prefix" => "rate"], function(){
            Route::post("", [ServiceController::class, "rate"]);
            Route::put("update/{id}", [ServiceController::class, "updateRate"]);
            Route::delete("/delete/{id}", [ServiceController::class, "deleteRate"]);
        });
    });

    Route::group(["prefix" => "visitors"], function(){
        Route::get("",[VisitorController::class, "visitors"]);
        Route::post("create", [VisitorController::class, "create"]);
        Route::put("update/{id}", [VisitorController::class, "update"]);
        Route::delete("delete/{id}", [VisitorController::class, "delete"]);

        Route::group(["prefix" => "security"], function(){
            Route::get("", [VisitorController::class, "security"]);
            Route::get("check-in/{id}", [VisitorController::class, "checkIn"]);
            Route::get("check-out/{id}", [VisitorController::class, "checkOut"]);
        });
    });

    Route::group(["prefix" => "equipments"], function() {
        Route::get("{id}", [EquipmentController::class, "equipments"]);
    });
});
