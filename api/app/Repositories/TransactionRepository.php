<?php
namespace App\Repositories;

use App\Models\Invoice;
use App\Models\Payment;
use App\Interfaces\TransactionRepositoryInterface;

class TransactionRepository implements TransactionRepositoryInterface{

    const PER_PAGE = 5;
    const PAGE = 1;

    public function __construct() {}

    public function get() : array
    {
        $invoice = Invoice::latest()->limit(5)->get();
        $payments = Payment::latest()->limit(5)->get();
        return ["invoices" => $invoice, "payments" => $payments];
    }

    public function filter(array $conditions) : array
    {
        $perPage = self::PER_PAGE;
        $page =  self::PAGE;
        $payments = Payment::where($conditions)
                    ->latest()
                    ->skip(($page - 1) * $perPage)
                    ->take($perPage)
                    ->get();
        $invoices = Invoice::where($conditions)
                ->latest()
                ->skip(($page - 1) * $perPage)
                ->take($perPage)
                ->get();

        return ["payments" => $payments, "invoices" => $invoices];
    }

    public function payments(array $conditions, array $date)
    {
        $perPage = self::PER_PAGE;
        $page = request()->input("page", self::PAGE);
        if($date[0] == "" || $date[1] == ""){
            $payments = Payment::where($conditions)
                    ->latest()
                    ->skip(($page - 1) * $perPage)
                    ->take($perPage)
                    ->get();
        }else{
            $payments = Payment::where($conditions)
                    ->whereBetween('created_at',$date)
                    ->latest()
                    ->skip(($page - 1) * $perPage)
                    ->take($perPage)
                    ->get();
        }
        return $payments;
    }

    public function invoices(array $conditions, array $date)
    {
        $perPage = self::PER_PAGE;
        $page = request()->input("page", self::PAGE);
        if($date[0] == "" || $date[1] == ""){
            $invoices = Invoice::where($conditions)
                    ->latest()
                    ->skip(($page - 1) * $perPage)
                    ->take($perPage)
                    ->get();
        }else{
            $invoices = Invoice::where($conditions)
                ->whereBetween('created_at', $date)
                ->latest()
                ->skip(($page - 1) * $perPage)
                ->take($perPage)
                ->get();
        }


        return $invoices;
    }

    public function balance($conditions) : array
    {
        $rentcondition = $conditions;
        $rentcondition["type"] = "rent";

        $servicecondition = $conditions;
        $servicecondition['type'] = "service_charge";

        $rentInvoceTotal = Invoice::where($rentcondition)->sum('amount');
        $rentPaymentTotal = Payment::where($rentcondition)->sum('amount');

        $serviceInvoceTotal = Invoice::where($servicecondition)->sum('amount');
        $servicePaymentTotal = Payment::where($servicecondition)->sum('amount');

        $rentTotal = floatval($rentInvoceTotal) - floatval($rentPaymentTotal);
        $service_total = floatval($serviceInvoceTotal) - floatval($servicePaymentTotal);
        return [
            "rent_total" => $rentTotal,
            "service_total" => $service_total,
        ];
    }
}
