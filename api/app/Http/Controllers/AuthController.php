<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Auth\AuthManager;
use App\Http\Controllers\Controller;
use App\Http\Requests\CreateAccountRequest;
use App\Http\Requests\EmailRequest;
use App\Http\Requests\LoginRequest;
use App\Interfaces\UserRepositoryInterface;
use App\Services\OTPService;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    private UserRepositoryInterface $userRepository;

    private AuthManager $auth;

    private OTPService $otp;

    public function __construct(
        UserRepositoryInterface $userRepositoryInterface,
        AuthManager $auth,
        OTPService $otp
        )
    {
        $this->userRepository = $userRepositoryInterface;
        $this->auth = $auth;
        $this->otp = $otp;
    }

    public function email(EmailRequest $request) : JsonResponse
    {
        if(!$this->userRepository->exists(["email" => $request->email])){
            return response()->success();
        }else{
            return response()->error("Email address exists", 200);
        }

    }

    public function login(LoginRequest $request) : JsonResponse
    {
        $credentials = $request->only(['email', 'password']);

        if (! $token = $this->auth->attempt($credentials)) {
            return response()->success("Email or Password is incorrect", 200);
        }

        return $this->respondWithToken($token);
    }


    public function me() : JsonResponse
    {
        $me = $this->userRepository->me();
        return response()->success('Success', $me);
    }

    public function logout() : JsonResponse
    {
        auth()->logout();

        return response()->success('Successfully logged out');
    }

    public function refresh() : JsonResponse
    {
        return $this->respondWithToken($this->auth()->refresh());
    }


    protected function respondWithToken($token) : JsonResponse
    {
        return response()->success("Authorized", [
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60
        ]);
    }

    public function createAccount(CreateAccountRequest $request) : JsonResponse
    {
        if($this->userRepository->exists(["email" => $request->email])){
            return response()->error("Email already exists", 200);
        }else{
            $user = $this->userRepository->create([
                "name" => $request->name,
                "email" => $request->email,
                "password" => Hash::make($request->password),
            ]);
            $this->otp->generateAndSendOTP($user->id, $request->email);
            return $this->loginUser($request->email, $request->password);
        }
    }

    private function loginUser(string $email, string $password) : JsonResponse
    {
        if (!$token = auth()->attempt(["email" => $email, "password" => $password])) {
            return response()->error("Email or Password is incorrect", 200);
        }
        return $this->respondWithToken($token);
    }

    public function verify(Request $request) :  JsonResponse
    {
        if($this->otp->verifyOTP($request->email, $request->user()->id,  $request->otp)){
           return response()->success();
        }else{
            return response()->error("OTP incorrect", 200);
        }
    }

    public function resendOTP(Request $request) : JsonResponse
    {
        $this->otp->resendOTP($this->auth()->user()->id, $request->email);
        return response()->success();
    }

}
