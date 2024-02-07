<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Interfaces\TransactionRepositoryInterface;

class TransactionController extends Controller
{

    private TransactionRepositoryInterface $transaction;

    public function __construct(TransactionRepositoryInterface $transaction)
    {
        $this->transaction = $transaction;

    }

    public function transactions(Request $request) : JsonResponse
    {
        return response()->success("Success", $this->transaction->all(["tenant_id" => $request->tenant_id]));
    }
}
