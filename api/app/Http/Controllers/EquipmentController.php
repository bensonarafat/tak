<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Log;
use App\Interfaces\EquipmentRepositoryInterface;

class EquipmentController extends Controller
{
    private EquipmentRepositoryInterface $equipment;

    public function __construct(EquipmentRepositoryInterface $equipment)
    {
        $this->equipment = $equipment;
    }

    public function equipments($id) : JsonResponse
    {
        Log::info("ID $id");
        try {
            $equipments = $this->equipment->houseEquipments($id);
            Log::info("Equipment $equipments");
            return response()->success("Success", $equipments);
        } catch (Exception $e) {
            return response()->error();
        }
    }
}
