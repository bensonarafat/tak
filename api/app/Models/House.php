<?php

namespace App\Models;

use App\Models\TenantHouse;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class House extends Model
{
    use HasFactory;


    public function tenantHouse() : HasOne
    {
        return $this->hasOne(TenantHouse::class);
    }
}
