<?php
namespace App\Repositories;

use App\Models\Rate;
use App\Models\Service;
use Illuminate\Auth\AuthManager;
use App\Interfaces\ServiceRepositoryInterface;

class ServiceRepository implements ServiceRepositoryInterface
{
    private AuthManager $authManager;
    public function __construct(AuthManager $authManager)
    {

        $this->authManager = $authManager;
    }

    public function all()
    {
        return Service::where("user_id", $this->authManager->user()->id)->latest()->get();
    }

    public function exists(array $conditions) : bool
    {
        return Service::where($conditions)->exists();
    }

    public function create(array $data) : Service
    {
        return Service::create($data);
    }

    public function findById(int $id) : Service
    {
        return Service::find($id);
    }

    public function update(string $id, array $data) : void
    {
        Service::whereId($id)->update($data);
    }

    public function delete(string $id) : void
    {
        Service::whereId($id)->delete();
    }

    public function createRate(array $data) : Rate
    {
        return Rate::create($data);
    }

    public function updateRate(string $id, array $data) : void
    {
        Rate::whereId($id)->update($data);
    }

    public function deleteRate(int $id): void
    {
        Rate::whereId($id)->delete();
    }
}
