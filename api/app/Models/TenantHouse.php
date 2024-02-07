<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class TenantHouse extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'house_id',
        'tenant_id',
        'status',
    ];


    public function house() : BelongsTo
    {
        return $this->belongsTo(House::class);
    }

    public function user() : BelongsTo
    {
        return $this->belongsTo(User::class, "user_id");
    }
}
