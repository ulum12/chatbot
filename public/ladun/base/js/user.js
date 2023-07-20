// route 
var rProsesTambahUser = server + "app/user/tambah/proses";
var rGetDataUser = server + "app/user/data/res";
var rProsesUpdateUser = server + "app/user/update/proses";
var rProsesHapusUser = server + "app/user/hapus/proses";

// vue object 
var appUser = new Vue({
    el : '#divDataUser',
    data : {
        kdProdukEdit : ''
    },
    methods : {
        tambahUserAtc : function()
        {
            $("#modalTambahUser").modal("show");
            setTimeout(function(){
                document.querySelector("#txtNamaUser").focus();
            }, 500);
        },
        editAtc : function(id)
        {
            editUser(id);
        },
        prosesUpdateUserAtc : function(id)
        {
            // let nama = document.querySelector("#txtNamaUserEdit").value;
            let password = document.querySelector("#txtPasswordEdit").value;;
            let ds = {'id': id, 'password': password}
            axios.post(rProsesUpdateUser, ds).then(function(res){
                $("#modalEditUser").modal("hide");
                setTimeout(function(){
                    pesanUmumApp('success', 'Sukses', 'Data user berhasil diupdate');
                    renderPage('app/user/data');
                }, 300);
            });
        },
        prosesTambahUser : function()
        {
            prosesTambahUser();
        },
        deleteAtc : function(idProduk)
        {
            confirmQuest('info', 'Konfirmasi', 'Hapus User ...?', function (x) {deleteConfirm(idProduk)});
        }
    }
});
// inisialisasi 
$("#tblDataProduk").dataTable();



function deleteConfirm(id)
{
    let ds = {'id' : id}
    axios.post(rProsesHapusUser, ds).then(function(res){
        setTimeout(function(){
            pesanUmumApp('success', 'Sukses', 'Data User berhasil dihapus');
            renderPage('app/user/data', 'Data User');
        }, 10);
    });
}

function editUser(id)
{
    // appProduk.kdProdukEdit = idProduk;
    let ds = {'id' : id}
    axios.post(rGetDataUser, ds).then(function(res){
        $("#modalEditUser").modal("show");
        document.querySelector("#txtNamaUserEdit").value = res.data.username;
        document.querySelector("#txtPassword").value = '';
        setTimeout(function(){
            document.querySelector("#txtNamaUserEdit").focus();
        }, 500);
    });
}

function prosesTambahUser()
{
    let nama = document.querySelector("#txtNamaUser").value;
    let password = document.querySelector("#txtPassword").value;
    let role = document.querySelector("#txtRole").value;
    let ds = {'username':nama, 'password':password, 'role':role}
    axios.post(rProsesTambahUser, ds).then(function(res){
        $("#modalTambahUser").modal("hide");
        setTimeout(function(){
            pesanUmumApp('success', 'Sukses', 'Data User berhasil ditambahkan');
            renderPage('app/user/data', 'Data User');
        }, 300);
       
    });
}