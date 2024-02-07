<?php
namespace App\Interfaces;

use App\Models\Rate;
use App\Models\Service;

interface ServiceRepositoryInterface{

    public function all();

    public function exists(array $conditions) : bool;

    public function create(array $data) : Service;

    public function findById(int $id) : Service ;

    public function update(string $id, array $data) : void;

    public function delete(string $id) : void;

    public function createRate(array $data) : Rate;

    public function updateRate(string $id, array $data) : void;

    public function deleteRate(int $id): void;
}
