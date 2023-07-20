<!-- modal tambah Chatbot  -->
<div class="modal fade" tabindex="-1" role="dialog" id="modalTambahChatbot">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Tambah Chatbot</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="company">Nama Chatbot</label>
                    <input type="text" class="form-control" id="txtNamaChatbot">
                </div>
                <div class="form-group">
                    <label for="company">Pertanyaan</label>
                    <textarea type="text" class="form-control" id="txtDPertanyaan" rows="5" placeholder="Enter untuk pertanyaan selanjutnya." />
                </div>
                <div class="form-group">
                    <label for="company">Jawaban</label>
                    <textarea type="text" class="form-control" id="txtJawaban" rows="6" />
                </div>
                <div class="form-group">
                    <label for="company">Jawaban Tidak Ready</label>
                    <textarea type="text" class="form-control" id="txtJawabanSold" rows="6" />
                </div>
            </div>
            <div class="modal-footer bg-whitesmoke br">
                <button type="button" @click="prosesTambahChatbot()"  class="btn btn-info" data-dismiss="modal">Tambah Chatbot</button>
                <button type="button" class="btn btn-warning" data-dismiss="modal">Tutup</button>
            </div>
        </div>
    </div>
</div>

<!-- modal edit Chatbot  -->
<div class="modal fade" tabindex="-1" role="dialog" id="modalEditChatbot">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Chatbot</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="company">Nama Chatbot</label>
                    <input type="text" class="form-control" id="txtNamaChatbotEdit">
                </div>
                <div class="form-group">
                    <label for="company">Pertanyaan</label>
                    <textarea type="text" class="form-control" id="txtDPertanyaanEdit" rows="5" placeholder="Enter untuk pertanyaan selanjutnya." />
                </div>
                <div class="form-group">
                    <label for="company">Jawaban</label>
                    <textarea type="text" class="form-control" id="txtJawabanEdit" rows="6" />
                </div>
                <div class="form-group">
                    <label for="company">Jawaban Tidak Ready</label>
                    <textarea type="text" class="form-control" id="txtJawabanSoldEdit" rows="6" />
                </div>
            </div>
            <div class="modal-footer bg-whitesmoke br">
                <button type="button" @click="prosesUpdateChatbotAtc()"  class="btn btn-info" data-dismiss="modal">Update Chatbot</button>
                <button type="button" class="btn btn-warning" data-dismiss="modal">Tutup</button>
            </div>
        </div>
    </div>
</div>