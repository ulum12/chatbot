<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class M_Produk_image extends Model
{
    protected $table = "tbl_produk_image";
    protected $fillable = [
        'produk_uuid',
        'nama_image',
        'harpathga',
        'active'
    ];
}
