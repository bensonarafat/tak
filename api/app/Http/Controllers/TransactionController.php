<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Interfaces\TransactionRepositoryInterface;
use Illuminate\Auth\AuthManager;

class TransactionController extends Controller
{

    private AuthManager $auth;
    private TransactionRepositoryInterface $transaction;

    public function __construct(TransactionRepositoryInterface $transaction, AuthManager $auth)
    {
        $this->transaction = $transaction;
        $this->auth = $auth;

    }

    public function transactions() : JsonResponse
    {
        $data = $this->transaction->get();
        return response()->success("Success", $data);
    }


    public function rents() : JsonResponse
    {
        return response()->success("Success", $this->transaction->filter(
            [
                "house_id" => $this->auth->user()->tenant()->house_id,
                "tenant_id" => $this->auth->user()->tenant()->tenant_id,
                "type" => "rent",
            ]
            ));
    }

    public function serviceCharge() : JsonResponse
    {
        return response()->success("Success", $this->transaction->filter(
            [
                "house_id" => $this->auth->user()->tenant()->house_id,
                "tenant_id" => $this->auth->user()->tenant()->tenant_id,
                "type" => "service_charge",
            ]
            ));
    }

    public function balance() : JsonResponse
    {
        $total = $this->transaction->balance([
            "house_id" => $this->auth->user()->tenant()->house_id,
            "tenant_id" => $this->auth->user()->tenant()->tenant_id,
        ]);
        return response()->success('Success', $total);
    }

    public function invoices(Request $request) : JsonResponse
    {

        return response()->success("Success", $this->transaction->invoices(
            [
                "house_id" => $this->auth->user()->tenant()->house_id,
                "tenant_id" => $this->auth->user()->tenant()->tenant_id,
                "type" => $request->type,
            ]
            , [
                $request->start_date,
                $request->end_date
            ]));
    }

    public function payments(Request $request) : JsonResponse
    {
        return response()->success("Success", $this->transaction->payments([
            "house_id" => $this->auth->user()->tenant()->house_id,
            "tenant_id" => $this->auth->user()->tenant()->tenant_id,
            "type" => $request->type,
        ], [
            $request->start_date,
            $request->end_date
        ]));
    }
}
