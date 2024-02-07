<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Auth\AuthManager;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Hash;
use App\Interfaces\UserRepositoryInterface;

class UserController extends Controller
{
    private UserRepositoryInterface $userRepository;

    private AuthManager $auth;

    public function __construct(
        UserRepositoryInterface $userRepositoryInterface,
        AuthManager $auth,
        )
    {
        $this->userRepository = $userRepositoryInterface;
        $this->auth = $auth;
    }

    public function updateRole(Request $request)  : JsonResponse
    {
        try {
            $this->userRepository->update($this->auth->user()->id, [
                "role" => $request->role,
                "status" => $request->status,
            ]);
            return response()->success();
        } catch (Exception $e) {
           return response()->error();
        }

    }

    public function updateProfile(Request $request) : JsonResponse
    {
        try {
            $this->userRepository->update($this->auth->user()->id, [
                "name" => $request->name,
                "gender" => $request->gender,
                "phone" => $request->phone,
            ]);
            return response()->success();
        } catch (Exception $e) {
           return response()->error();
        }

    }

    public function changePassword(Request $request) : JsonResponse
    {
        try {
            $this->userRepository->update($this->auth->user()->id, [
                "password" => Hash::make($request->phone),
            ]);
            return response()->success();
        } catch (Exception $e) {
           return response()->error();
        }
    }

    public function updateAccountStatus(Request $request): JsonResponse
    {
        try {
            $this->userRepository->update($request->user_id, [
                "status" => $request->status
            ]);
            return response()->success();
        } catch (Exception $e) {
            return response()->error();
        }
    }
}
