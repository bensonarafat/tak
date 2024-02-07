<?php

namespace App\Http\Controllers;

use Exception;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Auth\AuthManager;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Log;
use App\Interfaces\VisitorRepositoryInterface;

class VisitorController extends Controller
{

    private VisitorRepositoryInterface $visitor;

    private AuthManager $auth;

    public function __construct(VisitorRepositoryInterface $visitor, AuthManager $auth)
    {
        $this->visitor = $visitor;

        $this->auth = $auth;
    }

    public function visitors() : JsonResponse
    {
        return response()->success("Success", $this->visitor->visitors($this->auth->user()->id));
    }

    public function security() : JsonResponse
    {
        $data = $this->visitor->security();
        return response()->success("Success", $data);
    }


    public function create(Request $request) : JsonResponse
    {
        try {

            $this->visitor->create([
                "user_id" => $this->auth->user()->id,
                "phone" => $request->phone,
                "arrival" => $request->arrival,
                "departure" => $request->departure,
                "car_regno" => $request->car_regno,
                "reason" => $request->reason,
                "destination" => $request->destination,
                "visitor_name" => $request->visitor_name
            ]);
            return response()->success();
        } catch (Exception $e) {
           return response()->error();
        }

    }

    public function update(Request $request, int $id) : JsonResponse
    {
        try {
            $this->visitor->update($id, [
                "phone" => $request->phone,
                "arrival" => $request->arrival,
                "departure" => $request->departure,
                "car_regno" => $request->car_regno,
                "reason" => $request->reason,
                "destination" => $request->destination,
                "vistor_name" => $request->vistor_name
            ]);
            return response()->success();
        } catch (Exception $e) {
            return  response()->error();
        }

    }

    public function checkIn(int $id) : JsonResponse
    {

        $this->visitor->update($id, [
            "check-in" => Carbon::now()
        ]);

        return response()->success();
    }

    public function checkOut(int $id) : JsonResponse
    {
        $this->visitor->update($id, [
            "check-out" => Carbon::now()
        ]);
        return response()->success();
    }

    public function delete(int $id) : JsonResponse
    {
        $this->visitor->delete($id);
        return response()->success();
    }
}
