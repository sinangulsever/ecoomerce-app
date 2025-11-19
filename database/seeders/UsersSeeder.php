<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        // Örnek Datalar
        $rowData = [
            ['name' => 'Salih Gencer', 'email' => 'admin@test.com', 'password' => bcrypt('admin123'), 'role' => 'admin'],
            ['name' => 'Ali Veli', 'email' => 'user@test.com', 'password' => bcrypt('user123'), 'role' => 'user'],
            ['name' => 'Ayşe Yılmaz', 'email' => 'ayse@mail.com', 'password' => bcrypt('ayse123'), 'role' => 'user'],
            ['name' => 'Mehmet Demir', 'email' => 'mehmetdemir@mail.com', 'password' => bcrypt('mehmet123'), 'role' => 'user'],
        ];

        DB::table('users')->insert($rowData);

    }
}
