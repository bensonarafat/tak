<?php
namespace App\Repositories;

use App\Interfaces\HouseRepositoryInterface;
use App\Models\House;
use App\Models\TenantHouse;

class HouseRepository implements HouseRepositoryInterface
{

    public function findById(int $id) : House
    {
        return House::find($id);
    }

    public function findTeantHouseById(int $id) : TenantHouse
    {
        return TenantHouse::find($id);
    }

    public function exists(array $conditions) : bool
    {
        return TenantHouse::where($conditions)->exists();
    }

    public function create(array $data) : TenantHouse
    {
        return TenantHouse::create($data);
    }

    public function update(string $id, array $data) : void
    {
        TenantHouse::whereId($id)->update($data);
    }

    public function houses()
    {
        return House::latest()->get();
    }


    public function tenantHouses() : TenantHouse
    {
        return TenantHouse::latest()->get();
    }
}
?>
