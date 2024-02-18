<?php

namespace App\Providers;

use App\Contracts\AuthMail;
use App\Services\OTPService;
use App\Repositories\UserRepository;
use App\Interfaces\AuthMailInterface;
use App\Repositories\HouseRepository;
use App\Repositories\ServiceRepository;
use App\Repositories\VisitorRepository;
use Illuminate\Support\ServiceProvider;
use App\Repositories\EquipmentRepository;
use App\Interfaces\UserRepositoryInterface;
use App\Repositories\TransactionRepository;
use App\Interfaces\HouseRepositoryInterface;
use App\Repositories\NotificationRepository;
use App\Interfaces\ServiceRepositoryInterface;
use App\Interfaces\VisitorRepositoryInterface;
use App\Interfaces\EquipmentRepositoryInterface;
use App\Interfaces\MessageRepositoryInterface;
use App\Interfaces\TransactionRepositoryInterface;
use App\Interfaces\NotificationRepositoryInterface;
use App\Repositories\MessageRepository;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->bind(UserRepositoryInterface::class, UserRepository::class);
        $this->app->bind(ServiceRepositoryInterface::class, ServiceRepository::class);
        $this->app->bind(EquipmentRepositoryInterface::class, EquipmentRepository::class);
        $this->app->bind(HouseRepositoryInterface::class, HouseRepository::class);
        $this->app->bind(VisitorRepositoryInterface::class, VisitorRepository::class);
        $this->app->bind(NotificationRepositoryInterface::class, NotificationRepository::class);
        $this->app->bind(MessageRepositoryInterface::class, MessageRepository::class);
        $this->app->bind(TransactionRepositoryInterface::class, TransactionRepository::class);
        $this->app->bind(AuthMailInterface::class, AuthMail::class);
        $this->app->singleton(OTPService::class, function ($app) {
            return new OTPService($app->make(AuthMailInterface::class));
        });
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
