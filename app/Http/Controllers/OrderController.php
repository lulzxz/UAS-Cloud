<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    public function __construct()
    {
        $this -> middleware('auth')->only(['list', 'dikonfirmasi_list', 'dikemas_list', 'dikirim_list', 'diterima_list', 'selesai-list']);
        $this -> middleware('api')->only(['store', 'create', 'destroy', 'ubah_status', 'baru', 'dikonfirmasi', 'dikemas', 'diterima', 'selesai']);


    }

    public function list()
    {
        
        return view('pesanan.index');
    }

    public function dikonfirmasi_list()
    {
        
        return view('pesanan.dikonfirmasi');
    }

    public function dikemas_list()
    {
        
        return view('pesanan.dikemas');
    }

    public function dikirim_list()
    {
        
        return view('pesanan.dikirim');
    }

    public function diterima_list()
    {
        
        return view('pesanan.diterima');
    }

    public function selesai_list()
    {
        
        return view('pesanan.selesai');
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $order= Order::with('member')->get();

        return response()->json([
            'data' => $order
        ]); 
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    { 
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'id_member' => 'required',
           
            
        ]);

        if ($validator->fails()){
            return response()->json(
                $validator->errors(),
                422
            );
        }

        $input =$request->all();
        $Order = Order::create($input);

        for ($i = 0; $i < count($input['id_produk']); $i++){
            OrderDetail::create([
                'id_order' => $Order['id'],
                'id_produk' => $input['id_produk'][$i],
                'jumlah' => $input['jumlah'][$i],
                'size' => $input['size'][$i],
                'color' => $input['color'][$i],
                'total' => $input['total'][$i],
            ]);
        }
        
        
        return response()->json([
            'data' => $Order
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Order $Order)
    {
        return response()->json([
            'data' => $Order
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Order $Order)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Order $Order)
    {

        $validator = Validator::make($request->all(),[
            'id_member' => 'required',
         
        ]);

        if ($validator->fails()){
            return response()->json(
                $validator->errors(),
                422
            );
        }

        $input =$request->all();
        $Order->update($input);

        OrderDetail::where('id_order', $Order['id'])->delete();

        for ($i = 0; $i < count($input['id_produk']); $i++){
            OrderDetail::create([
                'id_order' => $Order['id'],
                'id_produk' => $input['id_produk'][$i],
                'jumlah' => $input['jumlah'][$i],
                'size' => $input['size'][$i],
                'color' => $input['color'][$i],
                'total' => $input['total'][$i],
            ]);
        }

        return response()->json([
            'message' => 'success',
            'data' => $Order
        ]);
    }

    public function ubah_status(Request $request, Order $order)
    {
       
        $order->update([
            'status' =>  $request->status
        ]);

        return response()->json([
            'message' => 'success',
            'data' => $order
        ]);

    }




    public function baru()
    {
        $order= Order::with('member')->where('status', 'baru')->get();

        return response()->json([
            'data' => $order
        ]); 
    }

    public function dikonfirmasi()
    {

        $order = Order::with('member')->where('status', 'Dikonfirmasi')->get();
        return response()->json([
            'data' => $order
        ]); 
    }
    public function dikemas()
    {
        $order= Order::with('member')->where('status', 'Dikemas')->get();

        return response()->json([
            'data' => $order
        ]);  
    }
    public function dikirim()
    {
        $order= Order::with('member')->where('status', 'Dikirim')->get();

        return response()->json([
            'data' => $order
        ]); 
    }
    public function diterima()
    {
        $order= Order::with('member')->where('status', 'diterima')->get();

        return response()->json([
            'data' => $order
        ]);  
    }
    public function selesai()
    {
        $order= Order::with('member')->where('status', 'selesai')->get();

        return response()->json([
            'data' => $order
        ]); 
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Order $Order)
    {
        $Order->delete();

        return response()->json([
            'message' => 'success'
        ]);
    }

    public function countOrders()
    {
        $orderCount = Order::count();

        return response()->json([
            'orderCount' => $orderCount,
        ]);
    }

}
