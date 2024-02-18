<?php
namespace App\Repositories;

use App\Models\Notifications;
use App\Interfaces\NotificationRepositoryInterface;

class NotificationRepository implements NotificationRepositoryInterface{

    public function all()
    {
        return Notifications::latest()->get();
    }
}
?>
