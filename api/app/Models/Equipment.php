<?php

namespace App\Models;

use App\Models\House;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Equipment extends Model
{
    use HasFactory;

    protected $table = 'equipments';

    public function house(): HasOne
    {
        return $this->hasOne(House::class);
    }
}
