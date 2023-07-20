// route 
var rProsesTambahChatbot = server + "app/chatbot/tambah/proses";
var rGetDataChatbot = server + "app/chatbot/data/res";
var rProsesUpdateChatbot = server + "app/chatbot/update/proses";
var rProsesHapusChatbot = server + "app/chatbot/hapus/proses";

var uuid ='';
// vue object 
var appChatbot = new Vue({
    el : '#divData',
    data : {
        kdChatbotEdit : ''
    },
    methods : {
        tambahChatbotAtc : function()
        {
            $("#modalTambahChatbot").modal("show");
            setTimeout(function(){
                document.querySelector("#txtNamaChatbot").focus();
            }, 500);
        },
        editAtc : function(idChatbot)
        {
            editChatbot(idChatbot);
        },
        UploadAtc : function(idChatbot)
        {
            UploadChatbot(idChatbot);
        },
        prosesUpdateChatbotAtc : function()
        {
            let kdChatbot = appChatbot.kdChatbotEdit;
            let nama = document.querySelector("#txtNamaChatbotEdit").value;
            let pertanyaan = document.querySelector("#txtDPertanyaanEdit").value;
            let jawaban = document.querySelector("#txtJawabanEdit").value;
            let jawaban_salah = document.querySelector("#txtJawabanSoldEdit").value;
            
            let ds = {'kdChatbot':kdChatbot,'nama':nama, 'pertanyaan':pertanyaan, 'jawaban':jawaban, 'jawaban_salah':jawaban_salah}
            axios.post(rProsesUpdateChatbot, ds).then(function(res){
                $("#modalEditChatbot").modal("hide");
                setTimeout(function(){
                    pesanUmumApp('success', 'Sukses', 'Data Chatbot berhasil diupdate');
                    renderPage('app/chatbot/data');
                }, 300);
            });
        },
        prosesTambahChatbot : function()
        {
            prosesTambahChatbot();
        },
        deleteAtc : function(idChatbot)
        {
            confirmQuest('info', 'Konfirmasi', 'Hapus Chatbot ...?', function (x) {deleteConfirm(idChatbot)});
        },
        importChatbotAtc : function()
        {
            $("#modalImportChatbot").modal("show");
        },
        prosesImportChatbotAtc : function()
        {
            confirmQuest('info', 'Konfirmasi', 'Import Chatbot... ?', function (x) {konfirmasiImport()});
        }
    }
});
// inisialisasi 
$("#tblDataChatbot").dataTable();

function konfirmasiImport()
{
    axios.post(rProsesImportChatbot).then(function(res){
        let pesan = "Chatbot berhasil di import, total "+res.data.totalChatbot+" Chatbot berhasil di import ..";
        $("#modalImportChatbot").modal("hide");
        setTimeout(function(){
            pesanUmumApp('success', 'Sukses', pesan);
            renderPage('app/chatbot/data', 'Chatbot');
        }, 400);
    });
}

function deleteConfirm(idChatbot)
{
    let ds = {'idChatbot' : idChatbot}
    axios.post(rProsesHapusChatbot, ds).then(function(res){
        setTimeout(function(){
            pesanUmumApp('success', 'Sukses', 'Data Chatbot berhasil dihapus');
            renderPage('app/chatbot/data', 'Chatbot');
        }, 10);
    });
}

function editChatbot(idChatbot)
{
    appChatbot.kdChatbotEdit = idChatbot;
    let ds = {'idChatbot' : idChatbot}
    axios.post(rGetDataChatbot, ds).then(function(res){
        $("#modalEditChatbot").modal("show");
        document.querySelector("#txtNamaChatbotEdit").value = res.data.nama_bot;
        document.querySelector("#txtDPertanyaanEdit").value = res.data.pertanyaan;
        document.querySelector("#txtJawabanEdit").value = res.data.jawaban;
        document.querySelector("#txtJawabanSoldEdit").value = res.data.jawaban_salah;
        setTimeout(function(){
            document.querySelector("#txtNamaChatbotEdit").focus();
        }, 500);
    });
}

function prosesTambahChatbot()
{
    let nama = document.querySelector("#txtNamaChatbot").value;
    let pertanyaan = document.querySelector("#txtDPertanyaan").value;
    let jawaban = document.querySelector("#txtJawaban").value;
    let jawaban_salah = document.querySelector("#txtJawabanSold").value;

    let ds = {'nama':nama, 'pertanyaan':pertanyaan, 'jawaban':jawaban, 'jawaban_salah':jawaban_salah}
    axios.post(rProsesTambahChatbot, ds).then(function(res){
        $("#modalTambahChatbot").modal("hide");
        setTimeout(function(){
            pesanUmumApp('success', 'Sukses', 'Data Chatbot berhasil ditambahkan');
            renderPage('app/chatbot/data', 'Chatbot');
        }, 300);
       
    });
}
