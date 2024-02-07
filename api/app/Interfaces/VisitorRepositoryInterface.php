<?php
namespace App\Interfaces;

use App\Models\Visitor;

interface VisitorRepositoryInterface{

    public function all();

    public function visitors(int $id);

    public function security();

    public function create(array $data) : Visitor;

    public function update(int $id, array $data);

    public function delete(int $id);
}
?>
