<?php
namespace App\Interfaces;

use App\Models\House;
use App\Models\TenantHouse;

interface HouseRepositoryInterface{

    public function findById(int $id) : House;

    public function findTeantHouseById(int $id ) : TenantHouse;

    public function exists(array $conditions) : bool;

    public function create(array $data) : TenantHouse;

    public function update(string $id, array $data) : void;

    public function houses();

    public function tenantHouses() : TenantHouse ;
}
?>
