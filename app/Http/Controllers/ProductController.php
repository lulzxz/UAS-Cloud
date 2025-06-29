<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use App\Models\Subcategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;



class ProductController extends Controller
{
    public function __construct()
    {
        $this -> middleware('auth')->only(['list']);
        $this -> middleware('api')->only(['store', 'create', 'destroy']);

    }

    public function list()
    {
        $categories = Category::all();
        $subcategories = Subcategory::all();
        return view('barang.index', compact('categories', 'subcategories'));
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $product = Product::with('category', 'subcategory')->get();

        return response()->json([
            'data' => $product
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
            'id_kategori' => 'required',
            'id_subkategori' => 'required',
            'nama_barang' => 'required',
            'harga' => 'required',
            'diskon' => 'required',
            'bahan' => 'required',
            'tags' => 'required',
            'sku' => 'required',
            'ukuran' => 'required',
            'warna' => 'required',
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
        
        $product = Product::create($input);
        
        return response()->json([
            'success' => true,
            'data' => $product
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Product $Product)
    {
        return response()->json([
            'data' => $Product
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Product $Product)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $Product)
    {

        $validator = Validator::make($request->all(),[
            'id_kategori' => 'required',
            'id_subkategori' => 'required',
            'nama_barang' => 'required',
            'harga' => 'required',
            'diskon' => 'required',
            'bahan' => 'required',
            'tags' => 'required',
            'sku' => 'required',
            'ukuran' => 'required',
            'warna' => 'required',
            'deskripsi'=> 'required',
        ]);

        if ($validator->fails()){
            return response()->json(
                $validator->errors(),
                422
            );
        }

        $input =$request->all();

        if ($request->has('gambar')){
            File::delete('uploads/',$Product->gambar);
            $gambar = $request -> file('gambar');
            $nama_gambar = time(). rand(1,9) . ',' . $gambar->getClientOriginalExtension();
            $gambar->move('uploads',$nama_gambar);
            $input['gambar']= $nama_gambar;
        } else {
            unset($input['gambar']);
        }


        $Product->update($input);

        return response()->json([
            'success' => true,
            'message' => 'success',
            'data' => $Product
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $Product)
    {
        File::delete('uploads/',$Product->gambar);
        $Product->delete();

        return response()->json([
            'success' => true,
            'message' => 'success'
        ]);
    }
}
