<?php
namespace App\Interfaces;

interface MessageRepositoryInterface {

    public function findByUser(int $id);

    public function create(array $data);

    public function update(int $id, array $data) : void;
}
?>
