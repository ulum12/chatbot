// route 
var rProsesTambahProduk = server + "app/produk/tambah/proses";
var rGetDataProduk = server + "app/produk/data/res";
var rProsesUpdateProduk = server + "app/produk/update/proses";
var rProsesHapusProduk = server + "app/produk/hapus/proses";
var rProsesImportProduk = server +  "app/produk/import/proses";
var rGetDataProdukImage = server + "app/produk/data/resimage";
var rProsesUpdateProdukImage = server + "app/produk/updateImage/proses";
var rProsesHapusProdukImage= server + "app/produk/hapusimage/proses";
var uuid ='';
// vue object 
var appProduk = new Vue({
    el : '#divDataProduk',
    data : {
        kdProdukEdit : ''
    },
    methods : {
        tambahProdukAtc : function()
        {
            $("#modalTambahProduk").modal("show");
            setTimeout(function(){
                document.querySelector("#txtNamaProduk").focus();
            }, 500);
        },
        editAtc : function(idProduk)
        {
            editProduk(idProduk);
        },
        UploadAtc : function(idProduk)
        {
            UploadProduk(idProduk);
        },
        prosesUpdateProdukAtc : function()
        {
            let kdProduk = appProduk.kdProdukEdit;
            let nama = document.querySelector("#txtNamaProdukEdit").value;
            let harga = document.querySelector("#txtHargaEdit").value;
            let stok = document.querySelector("#txtStokEdit").value;
            let warna = document.querySelector("#txtWarnaEdit").value;
            let bahan = document.querySelector("#txtBahanEdit").value;
            let ukuran = document.querySelector("#txtUkuranEdit").value;
            let berat = document.querySelector("#txtBeratEdit").value;
            let penutup = document.querySelector("#txtPenutupEdit").value;
            let link_shopee = document.querySelector("#txtLink_shopeeEdit").value;
            let link_tiktokshop = document.querySelector("#txtLink_tiktokshopEdit").value;
            let deskripsi = document.querySelector("#txtDescriptionEdit").value;
            
            let ds = {
                'kdProduk':kdProduk,
                'nama':nama,
                'harga':harga,
                'warna':warna,
                'bahan':bahan,
                'size':ukuran,
                'berat':berat,
                'penutup':penutup,
                'stok':stok,
                'link_shopee':link_shopee,
                'link_tiktokshop':link_tiktokshop,
                'deskripsi':deskripsi}
            axios.post(rProsesUpdateProduk, ds).then(function(res){
                $("#modalEditProduk").modal("hide");
                setTimeout(function(){
                    pesanUmumApp('success', 'Sukses', 'Data produk berhasil diupdate');
                    renderPage('app/produk/data');
                }, 300);
            });
        },
        prosesTambahProduk : function()
        {
            prosesTambahProduk();
        },
        deleteAtc : function(idProduk)
        {
            confirmQuest('info', 'Konfirmasi', 'Hapus produk ...?', function (x) {deleteConfirm(idProduk)});
        },
        importProdukAtc : function()
        {
            $("#modalImportProduk").modal("show");
        },
        prosesImportProdukAtc : function()
        {
            confirmQuest('info', 'Konfirmasi', 'Import produk... ?', function (x) {konfirmasiImport()});
        }
    }
});
// inisialisasi 
$("#tblDataProduk").dataTable();

function konfirmasiImport()
{
    axios.post(rProsesImportProduk).then(function(res){
        let pesan = "Produk berhasil di import, total "+res.data.totalProduk+" produk berhasil di import ..";
        $("#modalImportProduk").modal("hide");
        setTimeout(function(){
            pesanUmumApp('success', 'Sukses', pesan);
            renderPage('app/produk/data', 'Produk');
        }, 400);
    });
}

function deleteConfirm(idProduk)
{
    let ds = {'idProduk' : idProduk}
    axios.post(rProsesHapusProduk, ds).then(function(res){
        setTimeout(function(){
            pesanUmumApp('success', 'Sukses', 'Data produk berhasil dihapus');
            renderPage('app/produk/data', 'Produk');
        }, 10);
    });
}

function editProduk(idProduk)
{
    appProduk.kdProdukEdit = idProduk;
    let ds = {'idProduk' : idProduk}
    axios.post(rGetDataProduk, ds).then(function(res){
        $("#modalEditProduk").modal("show");
        document.querySelector("#txtNamaProdukEdit").value = res.data.nama_produk;
        document.querySelector("#txtHargaEdit").value = res.data.harga;
        document.querySelector("#txtWarnaEdit").value = res.data.warna;
        document.querySelector("#txtBahanEdit").value = res.data.bahan;
        document.querySelector("#txtUkuranEdit").value = res.data.size;
        document.querySelector("#txtBeratEdit").value = res.data.berat;
        document.querySelector("#txtPenutupEdit").value = res.data.penutup;
        document.querySelector("#txtStokEdit").value = res.data.stok;
        document.querySelector("#txtLink_shopeeEdit").value = res.data.link_shopee;
        document.querySelector("#txtLink_tiktokshopEdit").value = res.data.link_tiktokshop;
        document.querySelector("#txtDescriptionEdit").value = res.data.deskripsi;
        setTimeout(function(){
            document.querySelector("#txtNamaProdukEdit").focus();
        }, 500);
    });
}

function UploadProduk(idProduk)
{
    uuid = idProduk;
    let ds = {'idProduk' : idProduk}
    axios.post(rGetDataProdukImage, ds).then(function(res){
        $("#modalUploadProduk").modal("show");

        var myDropzone = new Dropzone("#kt_dropzonejs_example_1", {
            url: rProsesUpdateProdukImage, // Set the url for your upload script location
            paramName: "image", // The name that will be used to transfer the file
            maxFiles: 3,
            acceptedFiles: ".jpeg,.jpg,.png",
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            maxFilesize: 10, // MB
            addRemoveLinks: true,
            thumbnailWidth: 120,
            thumbnailHeight: 120,
            params: {
                'produk_uuid' : uuid // Your gallery Id
            },
            accept: function(file, done) {
                done();
            },
            success: function(file,res) {
                file.upload.imageName = res.imageName;
                setTimeout(function(){
                    pesanUmumApp('success', 'Sukses', 'Gambar produk berhasil disimpan');
                }, 10);
            }
        });

        if(res.data.length > 0){
            for (i = 0; i < res.data.length; i++) {
                var mockFile = { 
                    imageName: res.data[i].nama_image, 
                    uuid: res.data[i].produk_uuid, 
                    name: res.data[i].name, 
                    status: Dropzone.ADDED, 
                    progress: '100', 
                    url: res.data[i].path
                };

                // Call the default addedfile event handler
                myDropzone.emit("addedfile", mockFile);
                // And optionally show the thumbnail of the file:
                myDropzone.emit("thumbnail", mockFile, res.data[i].path)
                {
                    $('[data-dz-thumbnail]').css('height', '120');
                    $('[data-dz-thumbnail]').css('width', '120');
                    $('[data-dz-thumbnail]').css('object-fit', 'cover');
                }; 

                myDropzone.files.push(mockFile); 
            }
        }

        myDropzone.on("removedfile", function (file) {
            let nama_image = file.imageName ? file.imageName :file.upload.imageName;
            let ds = {'idProduk' : uuid, 'nama_image': nama_image }
            axios.post(rProsesHapusProdukImage, ds).then(function(res){
                setTimeout(function(){
                    pesanUmumApp('success', 'Sukses', 'Gambar produk berhasil dihapus');
                }, 10);
            });
        });
    });
}

function prosesTambahProduk()
{
    let nama = document.querySelector("#txtNamaProduk").value;
    let warna = document.querySelector("#txtWarna").value;
    let bahan = document.querySelector("#txtBahan").value;
    let ukuran = document.querySelector("#txtUkuran").value;
    let berat = document.querySelector("#txtBerat").value;
    let penutup = document.querySelector("#txtPenutup").value;
    let harga = document.querySelector("#txtHarga").value;
    let stok = document.querySelector("#txtStok").value;

    let link_shopee = document.querySelector("#txtLink_shopee").value;
    let link_tiktokshop = document.querySelector("#txtLink_tiktokshop").value;
    let deskripsi = document.querySelector("#txtDescription").value;
    let ds = {
            'nama':nama, 
            'warna':warna, 
            'bahan':bahan, 
            'size':ukuran, 
            'berat':berat, 
            'penutup':penutup, 
            'harga':harga, 
            'stok':stok, 
            'link_shopee':link_shopee, 
            'link_tiktokshop':link_tiktokshop, 
            'deskripsi':deskripsi}
    axios.post(rProsesTambahProduk, ds).then(function(res){
        $("#modalTambahProduk").modal("hide");
        setTimeout(function(){
            pesanUmumApp('success', 'Sukses', 'Data produk berhasil ditambahkan');
            renderPage('app/produk/data', 'Produk');
        }, 300);
       
    });
}
