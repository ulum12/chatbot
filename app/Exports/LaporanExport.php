<?php
namespace App\Exports;

use DB;
use App\User;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithMapping;
use App\Models\M_Laporan;
use Carbon\Carbon;

class LaporanExport implements FromCollection, WithHeadings, WithMapping
{
    use Exportable;

    protected $parameter;

    public function __construct($parameter)
    {
        $this->parameter = $parameter;
    }

    public function collection()
    {
        $dataLaporan = DB::table('tbl_total_pertanyaan')
                     ->join('tbl_produk', 'tbl_total_pertanyaan.barang_id', '=', 'tbl_produk.id')
                     ->select('tbl_produk.nama_produk', 'tbl_total_pertanyaan.barang_id', DB::raw('COUNT(tbl_total_pertanyaan.barang_id) as total'))
                     ->groupBy('tbl_total_pertanyaan.barang_id')
                     ->groupBy('tbl_produk.nama_produk')
                     ->orderBy('total', 'desc')
                     ->when($this->parameter === '1', function ($query) {
                        $query->whereDay('tbl_total_pertanyaan.created_at', Carbon::now()->day);
                     })
                     ->when($this->parameter === '2', function ($query) {
                        $query->whereMonth('tbl_total_pertanyaan.created_at', Carbon::now()->month);
                     }) 
                     ->when($this->parameter === '3', function ($query) {
                        $query->whereYear('tbl_total_pertanyaan.created_at', Carbon::now()->year);
                     })
                     ->get();

        $i = 0;
        $no = 0;
        foreach ($dataLaporan as $row) {
            $dataLaporan[$i]->no = $no + 1;
            $dataLaporan[$i]->liked = $this->_Get_Total_By_Liked($row->barang_id, $this->parameter);
            $dataLaporan[$i]->not_liked = $this->_Get_Total_By_No_Liked($row->barang_id, $this->parameter);
            $i++;
            $no++;
        }

        return $dataLaporan;
    }

    public function headings(): array
    {
        return [
            'No',
            'Nama Barang',
            'Sering Ditanyakan',
            'Disukai',
            'Kurang disukai',
        ];
    }

    public function map($data): array
    {
        return [
            $data->no,
            $data->nama_produk,
            $data->total,
            $data->liked,
            $data->not_liked,
        ];
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
}
