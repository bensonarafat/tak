<?php
namespace App\Interfaces;

use App\Models\User;

interface UserRepositoryInterface {

    public function exists(array $conditions) : bool;

    public function create(array $data) : User;

    public function findById(int $id) : User ;

    public function getByEmail(string $email) : User;

    public function update(string $id, array $data) : void;

    public function delete(string $id) : void;

    public function me();
}
?>
