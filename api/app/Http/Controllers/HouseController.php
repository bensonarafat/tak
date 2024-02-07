<?php

namespace App\Http\Controllers;

use App\Interfaces\HouseRepositoryInterface;
use App\Interfaces\UserRepositoryInterface;
use Exception;
use Illuminate\Auth\AuthManager;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class HouseController extends Controller
{
    private HouseRepositoryInterface $houseRepository;

    private UserRepositoryInterface $userRepository;

    private AuthManager $auth;

    public function __construct(HouseRepositoryInterface $houseRepository, AuthManager $auth, UserRepositoryInterface $userRepository,)
    {
        $this->houseRepository = $houseRepository;
        $this->userRepository = $userRepository;
        $this->auth = $auth;
    }

    public function houses() : JsonResponse
    {
        return response()->success("success", $this->houseRepository->houses());
    }


    public function selectHouse(Request $request) : JsonResponse
    {
        try {
            $this->houseRepository->create([
                "house_id" => $request->house_id,
                "user_id" => $this->auth->user()->id,
            ]);
            $this->userRepository->update($this->auth->user()->id, [
                "status" => $request->status,
                "role" => $request->role,
            ]);
            return response()->success();
        } catch (Exception $e) {
            return response()->error();
        }

    }


    public function updateStatus(Request $request) : JsonResponse
    {
        try {
            $this->houseRepository->update($request->houseId ,[
                "status" => $request->status,
                "tenant_id" => $request->tenant_id,
            ]);
            return response()->success();
        } catch (Exception $e) {
            return response()->error();
        }
    }

}
