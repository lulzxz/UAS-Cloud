<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function member()
    {
        return $this->belongsTo(Member::class, 'id_member' , 'id');
    }

    public function payment()
    {
        return $this->hasMany(Payment::class);
    }

    // public function orders()
    // {
    //     // Retrieve the row count from the "orders" table
    //     $orderCount = Order::count();

    //     // Pass the count to the view
    //     return view('app.blade.php', ['orderCount' => $orderCount]);
    // }
}
