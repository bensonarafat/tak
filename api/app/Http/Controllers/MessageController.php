<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Auth\AuthManager;
use Illuminate\Http\JsonResponse;
use App\Interfaces\MessageRepositoryInterface;

class MessageController extends Controller
{

    private MessageRepositoryInterface $messages;

    private AuthManager $auth;

    public function __construct(
        MessageRepositoryInterface $messages,
        AuthManager $auth
        )
    {
        $this->messages = $messages;

        $this->auth = $auth;
    }

    public function messages() : JsonResponse
    {
        return response()->success("Success", $this->messages->findByUser($this->auth->user()->id));
    }

    public function read(int $id) : JsonResponse
    {
        $this->messages->update($id, ["status" => "read"]);
        return response()->success();
    }

}
