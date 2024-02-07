<?php
namespace App\Repositories;

use App\Models\Invoice;
use App\Models\Payment;
use App\Models\Transaction;
use Illuminate\Auth\AuthManager;
use App\Collections\CombinedDataCollection;
use App\Interfaces\TransactionRepositoryInterface;

class TransactionRepository implements TransactionRepositoryInterface{

    private AuthManager $auth;

    public function __construct(AuthManager $auth)
    {
        $this->auth = $auth;
    }
    public function all(array $conditions)
    {
        // if($this->auth->user()->role != "tenant"){
        //     return Transaction::latest()->get();
        // }else{
        //     return Transaction::where($conditions)->latest()->get();
        // }
        $invoices = Invoice::latest()->get()->toArray();
        $payments = Payment::latest()->get()->toArray();
        $combinedData = new CombinedDataCollection(array_merge($invoices, $payments));
        return $combinedData;
    }
}
