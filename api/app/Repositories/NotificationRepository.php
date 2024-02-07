<?php
namespace App\Repositories;

use App\Models\Notifications;
use App\Interfaces\NotificationRespositoryInterface;

class NotificationRespository implements NotificationRespositoryInterface{

    public function findByUser(int $id) : Notifications
    {
        return Notifications::where("user_id", $id)->latest()->get();
    }

    public function create(array $data) : Notifications
    {
        return Notifications::create($data);
    }

    public function update(int $id, array $data) : void
    {
        Notifications::whereId($id)->update($data);
    }
}
?>
