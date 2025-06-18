<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Member;
use App\Models\Product;
use Illuminate\Http\Request;

class DashboardController extends Controller
{

    public function __construct() 
    {
        $this->middleware('auth');
    }

    // public function index()
    // {
    //     return view('dashboard');
    // }
    public function index()
    {
        // Retrieve the count of orders
        $orderCount = Order::count();

        // Retrieve the count of members
        $memberCount = Member::count();

        // Retrieve the count of items (barang)
        $barangCount = Product::count();

        return view('dashboard', ['orderCount' => $orderCount, 'memberCount' => $memberCount, 'barangCount' => $barangCount]);
    }
}
