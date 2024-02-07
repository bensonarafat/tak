<?php
namespace App\Repositories;

use App\Models\User;
use App\Interfaces\UserRepositoryInterface;

class UserRepository implements UserRepositoryInterface {

    public function exists(array $conditions) : bool
    {
        return User::where($conditions)->exists();
    }

    public function create(array $data) : User
     {
       return User::create($data);
    }

    public function findById(int $id) : User
    {
        return User::find($id);
    }

    public function getByEmail(string $email) : User
    {
        return User::where("email", $email)->first();
    }

    public function update(string $id, array $data) : void
    {
        User::whereId($id)->update($data);
    }

    public function delete(string $id) : void
    {
        User::whereId($id)->delete();
    }

    public function me()
    {
        $user = User::whereId(auth()->user()->id)->with(['tenantHouse.house'])->first();
        return $user;
    }
}

?>
