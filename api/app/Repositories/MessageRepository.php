<?php
namespace App\Repositories;

use App\Models\Message;
use App\Interfaces\MessageRepositoryInterface;

class MessageRepository implements MessageRepositoryInterface{


    public function findByUser(int $id)
    {
        return Message::where("user_id", $id)->latest()->get();
    }

    public function create(array $data){
        return Message::create($data);
    }

    public function update(int $id, array $data) : void
    {
        Message::whereId($id)->update($data);
    }
}

?>
