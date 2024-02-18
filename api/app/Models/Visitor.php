<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

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

 public function user(): BelongsTo
 {
    return $this->belongsTo(User::class);
 }
}
