<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class M_Chatbot extends Model
{
    protected $table = "tbl_bot";
    protected $fillable = [
        'nama_bot',
        'pertanyaan',
        'jawaban',
        'active'
    ];
}
