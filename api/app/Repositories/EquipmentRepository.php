<?php
namespace App\Repositories;

use App\Models\Equipment;
use App\Interfaces\EquipmentRepositoryInterface;

class EquipmentRepository implements EquipmentRepositoryInterface
{
    public function houseEquipments(int $id){
        return Equipment::where("house_id", $id)->latest()->get();
    }
}
