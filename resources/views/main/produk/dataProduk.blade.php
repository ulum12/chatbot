  <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">Data Produk</h4>
                <p class="card-title-desc">
                    <a class="btn btn-primary waves-effect waves-light" href="javascript:void(0)" @click="tambahProdukAtc()">
                        <i class="mdi mdi-plus-box-multiple-outline"></i>
                        Tambah Produk Baru
                    </a>
                </p>

                <div class="table-responsive">
                    <table class="table mb-0 table-hover" id="tblDataProduk">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nama Produk</th>
                                <th>Harga</th>
                                <th>Stok</th>
                                <th>Online Shop</th>
                                <th>Deskripsi</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                        @foreach($dataProduk as $produk)
                        <tr>
                            <th scope="row">{{ $loop -> iteration }}</th>
                            <td>{{ $produk -> nama_produk }}</td>
                            <td>Rp. {{ number_format($produk -> harga) }}</td>
                            <td>{{ $produk -> stok === '1' ? 'Ready' : 'Kosong'}}</td>
                            <td>
                                <a class="btn btn-info btn-sm waves-effect waves-light" title="Tiktok" href="{{ $produk -> link_shopee }}" target="_blank">
                                    <i class="mdi mdi-eye"></i>
                                    Shopee
                                </a>&nbsp;
                                <a class="btn btn-info btn-sm waves-effect waves-light" title="Shopee" href="{{ $produk -> link_tiktokshop }}" target="_blank">
                                    <i class="mdi mdi-eye"></i>
                                    Tiktok
                                </a>
                            </td>
                            <td>{{ $produk -> deskripsi }}</td>
                            <td>
                            <a class="btn btn-info btn-sm waves-effect waves-light" href="javascript:void(0)" @click="UploadAtc('{{ $produk -> uuid }}')">
                                <i class="mdi mdi-folder-edit-outline"></i>
                                Upload Photo
                            </a>&nbsp;
                            <a class="btn btn-primary btn-sm waves-effect waves-light" href="javascript:void(0)" @click="editAtc('{{ $produk -> uuid }}')">
                                <i class="mdi mdi-folder-edit-outline"></i>
                                Edit
                            </a>&nbsp;
                            <a class="btn btn-warning btn-sm waves-effect waves-light" href="javascript:void(0)" @click="deleteAtc('{{ $produk -> uuid }}')">
                                <i class="mdi mdi-folder-edit-outline"></i>
                                Hapus
                            </a>
                            </td>
                        </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>

