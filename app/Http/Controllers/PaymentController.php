<?php

namespace App\Http\Controllers;

use App\Models\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;

class PaymentController extends Controller
{
    public function __construct()
    {
        $this -> middleware('auth')->only(['list']);
        $this -> middleware('api')->only(['store', 'create', 'destroy']);


    }

    public function list()
    {
        
        return view('payment.index');
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = Payment::all();

        return response()->json($categories); 
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
            'nama_payment' => 'required',
            'deskripsi'=> 'required',
            'gambar' => 'required|image|mimes:jpg,png,jpeg,webp'
        ]);

        if ($validator->fails()){
            return response()->json(
                $validator->errors(),
                422
            );
        }

        $input =$request->all();

        if ($request->has('gambar')){
            $gambar = $request -> file('gambar');
            $nama_gambar = time(). rand(1,9) . ',' . $gambar->getClientOriginalExtension();
            $gambar->move('uploads',$nama_gambar);
            $input['gambar']= $nama_gambar;
        }
        
        $payment = Payment::create($input);
        
        return response()->json([
            'success' => true,
            'message' => 'success',
            'data' => $payment
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Payment $payment)
    {
        return response()->json([
            'data' => $payment
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Payment $payment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Payment $payment)
    {

        $validator = Validator::make($request->all(),[
            'tanggal' => 'required',
        ]);

        if ($validator->fails()){
            return response()->json(
                $validator->errors(),
                422
            );
        }


        $payment->update([
            'status' => request('status'),

        ]);

        return response()->json([
            'success' => true,
            'message' => 'success',
            'data' => $payment
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(payment $payment)
    {

        File::delete('uploads/' . $payment->gambar);
        $payment->delete();

        return response()->json([
            'success' => true,
            'message' => 'success'
        ]);
    }
}
