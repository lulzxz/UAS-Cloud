<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Product;
use illuminate\Support\Str;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i = 1; $i <= 10; $i++){
            Product::create([
            'id_kategori' => rand(1,3),
            'id_subkategori' => rand(1,4),
            'nama_barang' => 'Lorem ipsum dolor sit amet',
            'harga' => rand(10000, 100000),
            'diskon' => 0,
            'bahan' => 'Lorem ipsum dolor sit amet',
            'tags' => 'Lorem ipsum dolor sit amet',
            'sku' => Str::random(8),
            'ukuran' => 'S,M,L,XL,XXL',
            'warna' => 'required',
            'deskripsi'=> 'Lorem ipsum dolor sit amet',
            'gambar' => 'shop_image_'.$i.'jpg',
            ]);
        }
    }
}
