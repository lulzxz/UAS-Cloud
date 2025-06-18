<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AboutSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('about')->insert([
            'judul_website' => 'UAS Cloud Shop',
            'logo' => 'logo.png',
            'deskripsi' => 'Website toko online untuk tugas cloud computing.',
            'alamat' => 'Jl. Contoh No.123',
            'email' => 'admin@example.com',
            'telepon' => '081234567890',
            'atas_nama' => 'Mirsab Anwar',
            'rekening' => '1234567890',
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}
