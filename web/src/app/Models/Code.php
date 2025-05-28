<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Code extends Model
{
    use HasFactory;
    protected $table = 'codes';
    protected $fillable = ["path_entrada", "path_log", "result"];

    public function responses()
    {
        return $this->hasMany(CodeResponse::class);
    }

}
