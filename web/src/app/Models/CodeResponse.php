<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CodeResponse extends Model
{
    use HasFactory;
    protected $table = 'code_responses';

    protected $fillable = [
        'message',
        'code_id',
    ];


    public function code()
    {
        return $this->belongsTo(Code::class);
    }
}
