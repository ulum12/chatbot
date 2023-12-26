<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;

use App\Models\M_Laporan;
use App\Exports\LaporanExport;
use Maatwebsite\Excel\Facades\Excel;
use Carbon\Carbon;

class C_Laporan extends Controller
{
    public function dataLaporan()
    {
        $filter = isset($_GET['filter']) ? $_GET['filter'] : '1';

        $dataLaporan = DB::table('tbl_total_pertanyaan')
                     ->join('tbl_produk', 'tbl_total_pertanyaan.barang_id', '=', 'tbl_produk.id')
                     ->select('tbl_produk.nama_produk', 'tbl_total_pertanyaan.barang_id', DB::raw('COUNT(tbl_total_pertanyaan.barang_id) as total'))
                     ->groupBy('tbl_total_pertanyaan.barang_id')
                     ->groupBy('tbl_produk.nama_produk')
                     ->orderBy('total', 'desc')
                     ->when($filter === '1', function ($query) {
                        $query->whereDay('tbl_total_pertanyaan.created_at', Carbon::now()->day);
                     })
                     ->when($filter === '2', function ($query) {
                        $query->whereMonth('tbl_total_pertanyaan.created_at', Carbon::now()->month);
                     }) 
                     ->when($filter === '3', function ($query) {
                        $query->whereYear('tbl_total_pertanyaan.created_at', Carbon::now()->year);
                     })
                     ->get();

        $i = 0;
        foreach ($dataLaporan as $row) {
            $dataLaporan[$i]->liked = $this->_Get_Total_By_Liked($row->barang_id, $filter);
            $dataLaporan[$i]->not_liked = $this->_Get_Total_By_No_Liked($row->barang_id, $filter);
            $i++;
        }

        $dr = ['dataPengujian' => $dataLaporan, 'filter'=> $filter];


        return view('main.laporan.laporanData', $dr); 
    }

    function _Get_Total_By_Liked($id, $param) {
       $res = M_Laporan::where('liked', 1)
                 ->when($param === '1', function ($query) {
                    $query->whereDay('tbl_total_pertanyaan.created_at', Carbon::now()->day);
                 })
                 ->when($param === '2', function ($query) {
                    $query->whereMonth('tbl_total_pertanyaan.created_at', Carbon::now()->month);
                 }) 
                 ->when($param === '3', function ($query) {
                    $query->whereYear('tbl_total_pertanyaan.created_at', Carbon::now()->year);
                 })
                ->where('barang_id', $id)->count('liked');

        return $res;
    }
    
    function _Get_Total_By_No_Liked($id, $param) {
       $res = M_Laporan::where('liked', 0)
                 ->when($param === '1', function ($query) {
                    $query->whereDay('tbl_total_pertanyaan.created_at', Carbon::now()->day);
                 })
                 ->when($param === '2', function ($query) {
                    $query->whereMonth('tbl_total_pertanyaan.created_at', Carbon::now()->month);
                 }) 
                 ->when($param === '3', function ($query) {
                    $query->whereYear('tbl_total_pertanyaan.created_at', Carbon::now()->year);
                 })
                ->where('barang_id', $id)->count('liked');

        return $res;
    }
    public function export()
    {
        $parameter = isset($_GET['filter']) ? $_GET['filter'] : 1;
        return Excel::download(new LaporanExport($parameter), 'Laporan_'.date('Ymdhis').'.xlsx');
    }
}

