<?php
namespace App\Interfaces;


interface TransactionRepositoryInterface{

    public function get() : array;

    public function filter(array $conditions) : array;

    public function invoices(array $conditions, array $date);

    public function payments(array $conditions, array $date);

    public function balance(array $conditions) : array;
}
