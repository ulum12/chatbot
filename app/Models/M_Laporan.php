<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use App\Models\M_Nilai_Kombinasi;

class M_Laporan extends Model
{
    protected $table = "tbl_total_pertanyaan";

    protected $fillable = [
        'barang_id',
        'liked',
    ];

}
