<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{

    protected $table = 'notifications';

    use HasFactory;
    protected $fillable =['user_id','title','message','status'];
}
