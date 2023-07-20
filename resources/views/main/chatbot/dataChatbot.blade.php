  <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">Data Chatbot</h4>
                <p class="card-title-desc">
                    <a class="btn btn-primary waves-effect waves-light" href="javascript:void(0)" @click="tambahChatbotAtc()">
                        <i class="mdi mdi-plus-box-multiple-outline"></i>
                        Tambah Chatbot Baru
                    </a>
                </p>

                <div class="table-responsive">
                    <table class="table mb-0 table-hover" id="tblDataChatbot">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nama Chatbot</th>
                                <th>Pertanyaan</th>
                                <th>Jawaban</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                        @foreach($dataChatbot as $row)
                        <tr>
                            <th scope="row">{{ $loop -> iteration }}</th>
                            <td>{{ $row -> nama_bot }}</td>
                            <td>{{ $row -> pertanyaan }}</td>
                            <td>{{ $row -> jawaban }}</td>
                            <td>{{ $row -> deskripsi }}</td>
                            <td>
                            <a class="btn btn-primary btn-sm waves-effect waves-light" href="javascript:void(0)" @click="editAtc('{{ $row -> id }}')">
                                <i class="mdi mdi-folder-edit-outline"></i>
                                Edit
                            </a>&nbsp;
                            <a class="btn btn-warning btn-sm waves-effect waves-light" href="javascript:void(0)" @click="deleteAtc('{{ $row -> id }}')">
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

