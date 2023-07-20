<!-- modal tambah produk  -->
<div class="modal fade" tabindex="-1" role="dialog" id="modalTambahProduk">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Tambah Produk</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="company">Nama Produk</label>
                    <input type="text" class="form-control" id="txtNamaProduk">
                </div>
                <div class="form-group">
                    <label for="company">Harga</label>
                    <input type="text" class="form-control" id="txtHarga">
                </div>
                <div class="form-group">
                    <label for="company">Stok</label>
                    <select type="text" class="form-control" id="txtStok">
                        <option>Pilih Stok</option>
                        <option value="1">Ready</option>
                        <option value="0">Kosong</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="company">Link Shopee</label>
                    <input type="text" class="form-control" id="txtLink_shopee">
                </div>
                <div class="form-group">
                    <label for="company">Link Tiktok Shop</label>
                    <input type="text" class="form-control" id="txtLink_tiktokshop">
                </div>
                <div class="form-group">
                    <label for="company">Deskripsi</label>
                    <textarea type="text" class="form-control" id="txtDescription" />
                </div>
            </div>
            <div class="modal-footer bg-whitesmoke br">
                <button type="button" @click="prosesTambahProduk()"  class="btn btn-info" data-dismiss="modal">Tambah Produk</button>
                <button type="button" class="btn btn-warning" data-dismiss="modal">Tutup</button>
            </div>
        </div>
    </div>
</div>

<!-- modal edit produk  -->
<div class="modal fade" tabindex="-1" role="dialog" id="modalEditProduk">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Produk</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="company">Nama Produk</label>
                    <input type="text" class="form-control" id="txtNamaProdukEdit" readonly>
                </div>
                <div class="form-group">
                    <label for="company">Harga</label>
                    <input type="text" class="form-control" id="txtHargaEdit">
                </div>
                <div class="form-group">
                    <label for="company">Stok</label>
                    <select type="text" class="form-control" id="txtStokEdit">
                        <option>Pilih Stok</option>
                        <option value="1">Ready</option>
                        <option value="0">Kosong</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="company">Link Shopee</label>
                    <input type="text" class="form-control" id="txtLink_shopeeEdit">
                </div>
                <div class="form-group">
                    <label for="company">Link Tiktok Shop</label>
                    <input type="text" class="form-control" id="txtLink_tiktokshopEdit">
                </div>
                <div class="form-group">
                    <label for="company">Deskripsi</label>
                    <textarea type="text" class="form-control" id="txtDescriptionEdit" />
                </div>
                <div>
                </div>
            </div>
            <div class="modal-footer bg-whitesmoke br">
                <button type="button" @click="prosesUpdateProdukAtc()"  class="btn btn-info" data-dismiss="modal">Update Produk</button>
                <button type="button" class="btn btn-warning" data-dismiss="modal">Tutup</button>
            </div>
        </div>
    </div>
</div>

<!-- modal import produk  -->
<div class="modal fade" tabindex="-1" role="dialog" id="modalImportProduk">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Import Produk</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div>
                    <p>
                        Produk dapat diimport melalui data eksternal dari file Microsoft Excel(.xlxs), perhatikan beberapa hal berikut agar proses import berjalan lancar
                    </p>
                    <ul>
                        <li>Import produk akan <b>Menghapus</b> seluruh data produk yang sudah ada.</li>
                        <li>Pastikan format field/record sesuai dengan header kolom.</li>
                        <li>Silahkan lihat format file import data produk di <a href="{{ asset('file_import/DATA_PRODUK.xlsx') }}"><b>disini</b></a>, atau bisa edit file tersebut.</li>
                        <li>Pastikan lokasi/nama file yg akan diimport ada di "public/file_import/DATA_PRODUK.xlsx", kesalahan penamaan & lokasi folder akan membuat proses import gagal.</li>
                        <li>Jika dirasa point-point diatas sudah terpenuhi silahkan lakukan proses import produk</li>
                    </ul>
                    <div style="text-align: center;">
                        <a href="javascript:void(0)" class="btn btn-info btn-lg waves-effect waves-light" @click="prosesImportProdukAtc()">Import produk</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- modal upload image produk  -->
<div class="modal fade" tabindex="-1" role="dialog" id="modalUploadProduk">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Upload Image Produk</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div>
                    <!--begin::Form-->
                    <form class="form" action="#" method="post">
                        <!--begin::Input group-->
                        <div class="fv-row">
                            <!--begin::Dropzone-->
                            <div class="dropzone" id="kt_dropzonejs_example_1">
                                <!--begin::Message-->
                                <div class="dz-message needsclick">
                                    <i class="ki-duotone ki-file-up fs-3x text-primary"><span class="path1"></span><span class="path2"></span></i>

                                    <!--begin::Info-->
                                    <div class="ms-4">
                                        <h3 class="fs-5 fw-bold text-gray-900 mb-1">Drop files here or click to upload.</h3>
                                        <span class="fs-7 fw-semibold text-gray-400">Upload up to 3 files</span>
                                    </div>
                                    <!--end::Info-->
                                </div>
                            </div>
                            <!--end::Dropzone-->
                        </div>
                        <!--end::Input group-->
                    </form>
                    <!--end::Form-->
                </div>
            </div>
        </div>
    </div>
</div>