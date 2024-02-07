<?php
namespace App\Interfaces;

interface AuthMailInterface {

    public function sendOTP(string $otp, string $email) : void ;

    public function verifyMail(string $email) : void ;
}
?>
