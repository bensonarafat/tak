<?php

namespace App\Http\Controllers;

use Illuminate\Auth\AuthManager;
use Illuminate\Http\JsonResponse;
use App\Interfaces\NotificationRepositoryInterface;

class NotificationController extends Controller
{
    private NotificationRepositoryInterface $notification;

    private AuthManager $auth;

    public function __construct(
        NotificationRepositoryInterface $notification,
        AuthManager $auth
        )
    {
        $this->notification = $notification;

        $this->auth = $auth;
    }

    public function notification() : JsonResponse
    {
        return response()->success("Success", $this->notification->all());
    }

}
