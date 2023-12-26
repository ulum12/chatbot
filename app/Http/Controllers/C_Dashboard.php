<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\M_Produk;
use App\Models\M_Penjualan;
use App\Models\M_Laporan;
// use Auth;

class C_Dashboard extends Controller
{

    // public function __construct()
    // {
    //     $this->middleware('auth');
    // }
    public function dashboard()
    {
        return view('main.dashboard');
    }

    public function berandaPage()
    {
        $totalProduk = M_Produk::count();
        $totalPertanyaan = M_Laporan::count();
        $totalLike = M_Laporan::where('liked', 1)->count();
        $totalnotLike = M_Laporan::where('liked', 0)->count();

        $dataChart = [
            'labels' => ['Total Pertanyaan', 'Tertarik', 'Tidak Tertarik'],
            'data' => [$totalPertanyaan, $totalLike, $totalnotLike],
        ];
        
        $dr = [
            'totalProduk' => $totalProduk,
            'totalPertanyaan' => $totalPertanyaan,
            'totalLike' => $totalLike,
            'totalnotLike' => $totalnotLike,
            'dataChart' => $dataChart
        ];

        return view('main.berandaPage', $dr);
    }

    public function infoAplikasi()
    {
        return view('main.infoAplikasi');
    }

    function setAwal()
    {
        $dataAwal = array();
        $dr = ['respon' => $dataAwal];
        return \Response::json($dr);
    }
}
