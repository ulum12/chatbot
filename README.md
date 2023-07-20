<p align="center">
<img src="https://s3.jagoanstorage.com/aditia-storage/asset/logo/analisaPenjualan.png" width="200">
</p>

## Aplikasi Chatbot Telegram

<strong>Instalasi</strong>

- Pastikan sudah terinstall composer, lakukan instalasi dependency

<code>composer update</code>

- Copy file .env.example ke .env , setting database, kemudian lakukan migrate & seed : 

<code>php artisan migrate:refresh --seed</code>

- Untuk mengimport produk harap edit/sesuaikan format file yang ada di <code>public/file_import/DATA_PRODUK.xlsx</code>, kemudian jalankan perintah :

<code>php artisan importDataProduk</code>

- Untuk mengimport data penjualan/transaksi harap edit/sesuaikan format file yg ada di <code>public/file_import/DATA_PENJUALAN.xlsx</code>, kemudian jalankan perintah :

<code>php artisan importDataPenjualan</code>

- Untuk membuat data transaksi dummy, lakukan dengan perintah berikut, dimana tf(total faktur) adalah total faktur yg akan di create 

<code>php artisan createFakePenjualan tf=100</code>

Jika terdapat kendala dalam penggunaan/pengembangan aplikasi ini dapat menghubungi 


<i>Jika dirasa aplikasinya bermanfaat mungkin kiranya bisa mengapresiasi pengembang aplikasi ini dengan berdonasi di https://saweria.co/haxorsprogramming, berapapun donasi yang diberikan akan sangat membantu kami dalam pengembangan aplikasi" selanjutnya, terima kasih ,,, </i>


<code>run ngrox</code>
run ngrok http 8000
set webhook link dari ngrox 
access link/api/tele_update
