<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Auth\AuthenticationException;
use App\Http\Controllers\C_Auth;
use App\Http\Controllers\C_Dashboard;
use App\Http\Controllers\C_Produk;
use App\Http\Controllers\C_Chatbot;
use App\Http\Controllers\C_Penjualan;
use App\Http\Controllers\C_Apriori;
use App\Http\Controllers\C_Laporan;
use App\Http\Controllers\C_User;
use App\Http\Middleware\CheckStatus;
use App\Http\Controllers\BotManController;

Route::get('/', [C_Auth::class, 'loginPage']);
Route::post('/auth/login/proses', [C_Auth::class, 'loginProses']);
Route::get('/auth/logout', [C_Auth::class, 'logout']);
Route::get('/katalog', [C_Produk::class, 'katalogPage']);
Route::get('/katalog/{id}', [C_Produk::class, 'katalogDetailPage']);

Route::match(['get', 'post'], '/botman', [BotManController::class, 'handle']);

Route::middleware([CheckStatus::class])->group(function(){

	Route::get('/dashboard',[C_Dashboard::class, 'dashboard']);
	Route::get('/dashboard/beranda', [C_Dashboard::class, 'berandaPage']);

	Route::get('/app/produk/data', [C_Produk::class, 'dataProdukPage']);
	Route::post('/app/produk/tambah/proses', [C_Produk::class, 'prosesTambahProduk']);
	Route::post('/app/produk/data/res', [C_Produk::class, 'getDataProdukRes']);
	Route::post('/app/produk/update/proses', [C_Produk::class, 'prosesUpdateProduk']);
	Route::post('/app/produk/hapus/proses', [C_Produk::class, 'prosesHapusProduk']);
	Route::post('/app/produk/import/proses', [C_Produk::class, 'prosesImportProduk']);
	Route::post('/app/produk/data/resimage', [C_Produk::class, 'getDataProdukResImage']);
	Route::post('/app/produk/updateImage/proses', [C_Produk::class, 'prosesUpdateProdukImage']);
	Route::post('/app/produk/hapusimage/proses', [C_Produk::class, 'prosesHapusProdukImage']);

	Route::get('/app/chatbot/data', [C_Chatbot::class, 'dataChatbotPage']);
	Route::post('/app/chatbot/data/res', [C_Chatbot::class, 'getDataChatbotRes']);
	Route::post('/app/chatbot/tambah/proses', [C_Chatbot::class, 'prosesTambahChatbot']);
	Route::post('/app/chatbot/update/proses', [C_Chatbot::class, 'prosesUpdateChatbot']);
	Route::post('/app/chatbot/hapus/proses', [C_Chatbot::class, 'prosesHapusChatbot']);

	Route::get('/app/apriori/setup', [C_Apriori::class, 'setupPerhitunganApriori']);
	Route::post('/app/apriori/analisa/proses', [C_Apriori::class, 'prosesAnalisaApriori']);
	Route::get('/app/apriori/analisa/hasil/{kdPengujian}', [C_Apriori::class, 'hasilAnalisa']);
	Route::get('/apriori/analisa/cetak/{kdPengujian}', [C_Apriori::class, 'cetakAnalisa']);

	Route::get('/app/laporan/data', [C_Laporan::class, 'dataLaporan']);
	Route::get('/app/info-aplikasi', [C_Dashboard::class, 'infoAplikasi']);

	Route::get('/app/user/data', [C_User::class, 'dataUser']);
	Route::post('/app/user/tambah/proses', [C_User::class, 'prosesTambahUser']);
	Route::post('/app/user/data/res', [C_User::class, 'getDataUserRes']);
	Route::post('/app/user/update/proses', [C_User::class, 'prosesUpdateUser']);
	Route::post('/app/user/hapus/proses', [C_User::class, 'prosesHapusUser']);
});
