<?php
namespace App\Interfaces;

use App\Models\Notifications;

interface NotificationRespositoryInterface{

    public function findByUser(int $id) : Notifications;

    public function create(array $data) : Notifications;

    public function update(int $id, array $data) : void;

}
