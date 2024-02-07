<?php

namespace Database\Seeders;

use App\Models\Role;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user = User::factory()->create([
            "name" => "User",
            "password" => Hash::make("123456"),
            "email" => "admin@gmail.com",
            "role" => "admin",
        ]);
        User::whereId($user->id)->update([
            "email_verified_at" => Carbon::now(),
        ]);
    }
}
