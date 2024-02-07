<?php
namespace App\Repositories;

use Carbon\Carbon;
use App\Models\Visitor;
use App\Interfaces\VisitorRepositoryInterface;

class VisitorRepository implements VisitorRepositoryInterface{

    public function all() {
        return Visitor::latest()->get();
    }

    public function visitors(int $id) {
        return Visitor::where("user_id", $id)->latest()->get();
    }

    public function security(){
        $todayStart = Carbon::today()->startOfDay();
        $todayEnd = Carbon::today()->endOfDay();
        return Visitor::orderBy("arrival", 'desc')->whereBetween('arrival', [$todayStart, $todayEnd])->latest()->get();
    }

    public function create(array $data) : Visitor
    {
       return  Visitor::create($data);
    }


    public function update(int $id, array $data)
    {
        Visitor::whereId($id)->update($data);
    }

    public function delete(int $id)
    {
        Visitor::whereId($id)->delete();
    }
}
?>
