<?php
namespace App\Collections;

use App\Models\Invoice;
use App\Models\Payment;
use Illuminate\Support\Collection;

class CombinedDataCollection extends Collection {

    public function toArray()
    {
        $combinedData = [];
        foreach ($this->items as $item) {
            if ($item instanceof Invoice) {
                $combinedData[] = [
                    'from' => 'invoice',
                    'data' => $item->toArray(),
                ];
            } else if ($item instanceof Payment) {
                $combinedData[] = [
                    'from' => 'payment',
                    'data' => $item->toArray(),
                ];
            }
        }
        return $combinedData;
    }
}
?>
