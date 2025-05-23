<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Persona;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //

        $user = new User();
        $user ->name = 'Developer';
        $user ->email = 'ajuarezs3@miumg.edu.gt';
        $user ->password = bcrypt('umg');
        $user ->save();
        $id = $user->id;

    }
}
