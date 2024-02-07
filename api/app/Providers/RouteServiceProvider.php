<?php

namespace App\Providers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;

class RouteServiceProvider extends ServiceProvider
{
    /**
     * The path to your application's "home" route.
     *
     * Typically, users are redirected here after authentication.
     *
     * @var string
     */
    public const HOME = '/';

    /**
     * Define your route model bindings, pattern filters, and other route configuration.
     */
    public function boot(): void
    {

        $this->limiter();

        $this->route();

        $this->responses();
    }

    private function limiter() : void
    {
        RateLimiter::for('api', function (Request $request) {
            return Limit::perMinute(60)->by($request->user()?->id ?: $request->ip());
        });
    }

    private function route() : void
    {
        $this->routes(function () {
            Route::middleware('api')
                ->prefix('api')
                ->group(base_path('routes/api.php'));

            Route::middleware('web')
                ->group(base_path('routes/web.php'));
        });
    }

    private function responses()
    {
        Response::macro('success', function ( $message = 'Success', $data = null) {
            return response()->json([
                "status" => true,
                "message" => $message,
                "data" => $data,
            ]);
        });

        Response::macro('error', function ($message = "Something went wrong", $statusCode = 400){
            return response()->json([
                "status" => false,
                "message" => $message,
            ], $statusCode);
        });
    }
}
