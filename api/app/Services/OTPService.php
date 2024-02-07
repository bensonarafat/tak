<?php
namespace App\Services;

use Carbon\Carbon;
use App\Models\OTP;
use App\Models\User;
use App\Interfaces\AuthMailInterface;

class OTPService
{
    private AuthMailInterface $mail;

    public function __construct(AuthMailInterface $mail)
    {
        $this->mail = $mail;
    }

    public function generateAndSendOTP(int $userId, string $email): string
    {
        $otp = mt_rand(1111,9999);
        OTP::create([
            "user_id"=> $userId,
            "otp" => $otp,
            "expires" => Carbon::now()->addMinutes(15),
            "email" => $email,
        ]);

        $this->mail->sendOTP($otp, $email);

        return $otp;
    }

    public function verifyOTP(string $email, int $userId, string $otp) : bool
    {
        $otp = OTP::where([
            "user_id" => $userId,
            "otp" => $otp,
        ])->first();

        if($otp){
            $user = User::find($userId);
            $user->email_verified_at = Carbon::now();
            $user->save();

            $this->mail->verifyMail($email);
            $otp->delete();
            return true;
        }
        return false;
    }

    public function resendOTP(int $userId, string $email) : string
    {
        OTP::where('user_id', $userId)->delete();
        return $this->generateAndSendOTP($userId, $email);
    }
}
?>

