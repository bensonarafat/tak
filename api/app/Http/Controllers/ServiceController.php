<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Auth\AuthManager;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Log;
use App\Interfaces\ServiceRepositoryInterface;

class ServiceController extends Controller
{

    private ServiceRepositoryInterface $service;

    private AuthManager $auth;

    public function __construct(ServiceRepositoryInterface $service, AuthManager $auth)
    {
        $this->service = $service;

        $this->auth = $auth;
    }

    public function services() : JsonResponse
    {
        $services = $this->service->all();
        return response()->success("Success", $services);
    }

    public function create(Request $request) : JsonResponse
    {

        try {
            $this->service->create([
                "house_id" => $request->houseId,
                "description" => $request->description,
                "name" => $request->name,
                "section" => $request->section,
                "location" => $request->location,
                "maintenance" => $request->maintenance,
                "user_id" => $this->auth->user()->id,
                "priority" => $request->priority
            ]);
            return response()->success();
        } catch (Exception $e) {
            Log::info($e->getMessage());
            return response()->error();
        }

    }

    public function update(Request $request, int $id) : JsonResponse
    {
        try {
            $this->service->update( $id, [
                "house_id" => $request->houseId,
                "description" => $request->description,
                "name" => $request->name,
                "section" => $request->section,
                "location" => json_encode($request->location),
                "maintance" => json_encode($request->maintenance),
                "priority" => $request->priority
            ]);
            return response()->success();
        } catch (Exception $e) {
            return response()->error();
        }
    }

    public function updateStatus(Request $request, int $id) : JsonResponse
    {
        try {
            $this->service->update($id,  [
                "status" => $request->status
            ]);
            return response()->success();
        } catch (Exception $e) {
            return response()->error();
        }
    }

    public function delete(int $id) : JsonResponse
    {
        try {
            $this->service->delete($id);
            return response()->success();
        } catch (Exception $e) {
            return response()->error();
        }
    }


    public function rate(Request $request) : JsonResponse
    {
        try {
            $this->service->createRate([
                "user_id" => $this->auth->user()->id,
                "rate" => $request->rate,
                "comment"=> $request->comment,
                "service_id" => $request->serviceId,
            ]);
            return response()->success();
        } catch (Exception $e) {
            return response()->error();
        }
    }

    public function updateRate(Request $request, int $id) : JsonResponse
    {
        try {
            $this->service->updateRate($id,[
                "rate" => $request->rate,
                "comment"=> $request->comment,
            ]);
            return response()->success();
        } catch (Exception $e) {
            return response()->error();
        }
    }

    public function deleteRate(int $id) : JsonResponse
    {
        try {
            $this->service->deleteRate($id);
            return response()->success();
        } catch (Exception $e) {
            return response()->error();
        }
    }

}
