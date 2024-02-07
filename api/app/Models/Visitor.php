<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Visitor extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'phone',
        'arrival',
        'departure',
        'car_regno',
        'reason',
        'destination',
        'check-in',
        'check-out',
        'visitor_name'
    ];
}
