<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class M_Total_Pertanyaan extends Model
{
    protected $table = "tbl_total_pertanyaan";
    protected $fillable = [
        'barang_id',
        'liked',
    ];
}
