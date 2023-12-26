<div class="col-lg-12">
    <div class="card">
        <div class="card-body">
            <div class="d-flex justify-content-between">
                <p class="card-title-desc">
                    <button class="btn btn-primary waves-effect" id="btn-download">
                        <i class="mdi mdi-file-excel"></i>
                        Download Excel
                    </button>
                </p>
                <div class="form-group">
                    <select type="text" class="form-control" id="filterDate" >
                        <option value="1">Harian</option>
                        <option value="2">Bulanan</option>
                        <option value="3">Tahunan</option>
                    </select>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table mb-0 table-hover" id="tblLaporan">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nama Produk</th>
                            <th>Sering ditanyakan</th>
                            <th>Disukai</th>
                            <th>Kurang disukai</th>
                        </tr>
                    </thead>
                    <tbody>
                    @foreach($dataPengujian as $laporan)
                    <tr>
                        <td>{{ $loop -> iteration }}</td>
                        <td>{{ $laporan -> nama_produk }}</td>
                        <td>{{ $laporan -> total }}</td>
                        <td>{{ $laporan -> liked }}</td>
                        <td>{{ $laporan -> not_liked }}</td>
                    </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>

<script>

    $( document ).ready(function() {
        let filter = <?php echo $filter ?>;

        if(filter){
            $('#filterDate').val(filter);
        }
    });

    $("#tblLaporan").dataTable();

    $("#btn-download").click(function(){
        var val = $('#filterDate').val();
        window.open('/export?filter='+val);
    });

    $('#filterDate').change(function(){
        var val = $(this).val();

        renderPage(`app/laporan/data?filter=${val}`)
    });
</script>