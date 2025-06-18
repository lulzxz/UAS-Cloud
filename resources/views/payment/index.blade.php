@extends('layouts.app')

@section('tittle', 'Data Pembayaran')

@section('content')

    <div class="card shadow">
        <div class="card-header">
            <h4 class="card-title">
                Data Pembayaran
            </h4>

        </div>

        <div class="table-responsive">
            <table class="table table-bordered table-hover tabel-striped">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Tanggal</th>
                        <th>Order</th>
                        <th>jumlah</th>
                        <th>No Rekening</th>
                        <th>Atas Nama</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>

        </div>

    </div>

    </div>

    <div class="modal fade" id="modal-form" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Form Pembayaran</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <form class="form-pembayaran">
                                <div class="form-group">
                                    <label for="">Tanggal</label>
                                    <input type="text" class="form-control" name="tanggal" placeholder="Tanggal"
                                        required readonly>
                                </div>
                                <div class="form-group">
                                    <label for="">Jumlah</label>
                                    <input type="text" class="form-control" name="jumlah" placeholder="jumlah" required
                                        readonly>
                                </div>
                                <div class="form-group">
                                    <label for="">No Rekening</label>
                                    <input type="text" class="form-control" name="no_rekening" placeholder="No Rekening"
                                        required readonly>
                                </div>
                                <div class="form-group">
                                    <label for="">Atas Nama</label>
                                    <input type="text" class="form-control" name="atas_nama" placeholder="Atas Nama"
                                        required readonly>
                                </div>
                                <div class="form-group">
                                    <label for="">Status</label>
                                    <select name="status" id="status" class="form-control">
                                        <option value="DITERIMA">DITERIMA</option>
                                        <option value="DITOLAK">DITOLAK</option>
                                        <option value="MENUNGGU">MENUNGGU</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-block">SUBMIT</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script>
        $(function() {
            
            function date(date) {
                var date = new Date(date);
                var day = date.getDate();
                var month = date.getMonth();
                var year = date.getFullYear()

                return `${day}-${month}-${year}`;

            }


            $.ajax({
                url: '/api/payment',
                success: function(data) {
                    let row = '';
                    data.map(function(val, index) {
                        row += `
                           <tr>
                                <td>${index+1}</td>
                                <td>${date(val.created_at)}</td>
                                <td>${val.id_order}</td>
                                <td>${val.jumlah}</td>
                                <td>${val.no_rekening}</td>
                                <td>${val.atas_nama}</td>
                                <td>${val.status}</td>
                                
                                <td>
                                    <a data-toggle-"modal" href"#modal-form" data-id="${val.id}" class="btn btn-warning modal-ubah">Edit</a>
                                    
                                </td>
                            </tr>
                           
                           `;
                    });
                    $('tbody').append(row)
                }
            })



            //edit
            $(document).on('click', '.modal-ubah', function() {
                $('#modal-form').modal('show');
                const id = $(this).data('id');

                $.get('/api/payment/' + id, function({
                    data
                }) {
                    $('input[name="tanggal"]').val(date(data.created_at));
                    $('input[name="jumlah"]').val(data.jumlah);
                    $('input[name="no_rekening"]').val(data.no_rekening);
                    $('input[name="atas_nama"]').val(data.atas_nama);
                    $('select[name="status"]').val(data.status);
                });

                $('.form-pembayaran').submit(function(e) {
                    e.preventDefault();
                    const token = localStorage.getItem('token');
                    const frmdata = new FormData(this);

                    $.ajax({
                        url: `/api/payment/${id}?_method=PUT`,
                        type: "POST",
                        data: frmdata,
                        cache: false,
                        contentType: false,
                        processData: false,
                        headers: {
                            "Authorization": 'Bearer ' + token,
                        },
                        success: function(data) {
                            if (data.success) {
                                alert('Data berhasil diubah')
                                location.reload();
                            }
                        }

                    })
                });

            });

        });
    </script>
@endpush
