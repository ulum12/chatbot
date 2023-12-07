<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\File; 

use App\Models\M_Produk;
use App\Models\M_Produk_image;
use App\Models\M_Kategori;

class C_Produk extends Controller
{
    public function dataProdukPage()
    {
        $dataProduk = M_Produk::all();
        $dataKategori = M_Kategori::all();
        $dr = ['dataProduk' => $dataProduk, 'dataKategori' => $dataKategori];
        return view('main.produk.produk', $dr);
    }

    public function katalogPage()
    {
        $dataProduk = M_Produk::all();
        $i = 0;
        foreach ($dataProduk as $row) {
            $dataProduk[$i]->foto = DB::table('tbl_produk_image')
                                    ->select('*')
                                    ->where('produk_uuid', $row->uuid)
                                    ->get();
                                    $i++;
        }
        $dataKategori = M_Kategori::all();
        $dr = ['dataProduk' => $dataProduk, 'dataKategori' => $dataKategori];
        return view('main.produk.katalog', $dr);
    }

    public function katalogDetailPage($id)
    {
        $dataProduk = M_Produk::where('id', $id) -> first();
        $dataProduk->foto = DB::table('tbl_produk_image')
                                ->select('*')
                                ->where('produk_uuid', $dataProduk->uuid)
                                ->get();
                                
        $dr = ['dataProduk' => $dataProduk];

        return view('main.produk.katalogDetail', $dr);
    }

    public function prosesTambahProduk(Request $request)
    {
        // {'nama':nama, 'harga':harga, 'kategori':kategori}
        $produk = new M_Produk();
        $produk -> uuid = Str::uuid();
        $produk -> nama_produk = $request -> nama;
        $produk -> harga = $request -> harga;
        $produk -> stok = $request -> stok;
        $produk -> link_shopee = $request -> link_shopee;
        $produk -> link_tiktokshop = $request -> link_tiktokshop;
        $produk -> deskripsi = $request -> deskripsi;
        $produk -> status = "1";
        $produk -> save();
        $dr = ['status' => 'sukses'];
        return \Response::json($dr);
    }

    public function getDataProdukRes(Request $request)
    {
        $dataProduk = M_Produk::where('uuid', $request -> idProduk) -> first();
        return \Response::json($dataProduk);
    }

    public function prosesUpdateProduk(Request $request)
    {
        M_Produk::where('uuid', $request -> kdProduk) -> update([
            'nama_produk' => $request -> nama,
            'harga' => $request -> harga,
            'stok' => $request -> stok,
            'link_shopee' => $request -> link_shopee,
            'link_tiktokshop' => $request -> link_tiktokshop,
            'deskripsi' => $request -> deskripsi,
        ]);
        $dr = ['status' => 'sukses'];
        return \Response::json($dr);
    }

    public function prosesHapusProduk(Request $request)
    {
        M_Produk::where('uuid', $request -> idProduk) -> delete();
        $dr = ['status' => 'sukses'];
        return \Response::json($dr);
    }

    public function getDataProdukResImage(Request $request)
    {
        $dataProduk = M_Produk_image::where('produk_uuid', $request -> idProduk) -> get();

        if(!$dataProduk){
            $dataProduk = ['status' => 'tidak ada data'];
        }

        return \Response::json($dataProduk);
    }
    public function prosesUpdateProdukImage(Request $request)
    {

        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
        ]);
    
        $imageName = time().'.'.$request->image->extension();  
     
        $path = 'images_produk/'.$request->produk_uuid;
        $request->image->move(public_path($path),$imageName);

        $produk = new M_Produk_image();
        $produk -> produk_uuid = $request -> produk_uuid;
        $produk -> name = $request->image->getClientOriginalName();
        $produk -> nama_image = $imageName;
        $produk -> path = $path.'/'.$imageName;
        $produk -> save();

        $dr = ['status' => 'sukses', 'imageName' => $imageName];
        return \Response::json($dr);
    }

    public function prosesHapusProdukImage(Request $request)
    {
        $image_path = public_path("images_produk/{$request->idProduk}/{$request->nama_image}");
        echo $image_path;
        if (file_exists($image_path)) {
            //File::delete($image_path);
            unlink($image_path);
        }

        M_Produk_image::where('nama_image', $request -> nama_image) -> delete();
        $dr = ['status' => 'sukses'];
        return \Response::json($dr);
    }

    public function prosesImportProduk(Request $request)
    {
        Artisan::call('importDataProduk');
        $totalProduk = M_Produk::count();
        $dr = ['status' => 'sukses', 'totalProduk' => $totalProduk];
        return \Response::json($dr);
    }
}
