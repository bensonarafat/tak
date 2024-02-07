<?php

namespace App\Http\Controllers;

use App\Interfaces\NotificationRespositoryInterface;
use Illuminate\Auth\AuthManager;
use Illuminate\Http\JsonResponse;

class NotificationController extends Controller
{
    private NotificationRespositoryInterface $notification;

    private AuthManager $auth;

    public function __construct(
        NotificationRespositoryInterface $notification,
        AuthManager $auth
        )
    {
        $this->notification = $notification;

        $this->auth = $auth;
    }

    public function notification() : JsonResponse
    {
        return response()->success("Success", $this->notification->findByUser($this->auth->user()->id));
    }

    public function read(int $id) : JsonResponse
    {
        $this->notification->update($id, ["status" => "read"]);
        return response()->success();
    }
}
