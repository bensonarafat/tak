<?php
namespace App\Contracts;

use App\Mail\OTPMail;
use App\Mail\VerifyMail;
use Illuminate\Support\Facades\Mail;
use App\Interfaces\AuthMailInterface;

class AuthMail implements AuthMailInterface
{

    public function sendOTP(string $otp, string $email) : void
    {
        Mail::to($email)->send(new OTPMail($otp));
    }

    public function verifyMail(string $email) : void
    {
        Mail::to($email)->send(new VerifyMail());
    }
}
?>
