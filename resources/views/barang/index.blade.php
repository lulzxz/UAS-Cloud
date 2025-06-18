@extends('layouts.app')

@section('tittle', 'Data Barang')

@section('content')

    <div class="card shadow">
        <div class="card-header">
            <h4 class="card-title">
                Data Barang
            </h4>

        </div>
        <div class="card-body">
            <div class="d-flex justify-content-end mb-4 ">
                <a href="#modal-form" class="btn btn-primary modal-tambah">Tambah Data</a>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-hover tabel-striped">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>kategori</th>
                            <th>Subkategori</th>
                            <th>Nama Barang</th>
                            <th>Harga</th>
                            <th>Diskon</th>
                            <th>Bahan</th>
                            <th>SKU</th>
                            <th>Ukuran</th>
                            <th>Warna</th>
                            <th>Gambar</th>
                            <th>Aksi</th>
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
                    <h5 class="modal-title">Form Barang</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <form class="form-barang">
                                <div class="form-group">
                                    <label for="">Kategori</label>
                                    <select name="id_kategori" id="id_kategori" class="form-control">
                                        @foreach ($categories as $category)
                                            <option value="{{ $category->id }}">{{ $category->nama_kategori }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="">Subkategori</label>
                                    <select name="id_subkategori" id="id_subkategori" class="form-control">
                                        @foreach ($subcategories as $subcategory)
                                            <option value="{{ $subcategory->id }}">{{ $subcategory->nama_subkategori }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="">Nama Barang</label>
                                    <input type="text" class="form-control" name="nama_barang" placeholder="Nama Barang"
                                        required>
                                </div>
                                <div class="form-group">
                                    <label for="">Harga</label>
                                    <input type="text" class="form-control" name="harga" placeholder="Harga" required>
                                </div>
                                <div class="form-group">
                                    <label for="">Diskon</label>
                                    <input type="text" class="form-control" name="diskon" placeholder="Diskon" required>
                                </div>
                                <div class="form-group">
                                    <label for="">Bahan</label>
                                    <input type="text" class="form-control" name="bahan" placeholder="Bahan" required>
                                </div>
                                <div class="form-group">
                                    <label for="">Tags</label>
                                    <input type="text" class="form-control" name="tags" placeholder="Tags" required>
                                </div>
                                <div class="form-group">
                                    <label for="">Sku</label>
                                    <input type="text" class="form-control" name="sku" placeholder="Sku" required>
                                </div>
                                <div class="form-group">
                                    <label for="">Ukuran</label>
                                    <input type="text" class="form-control" name="ukuran" placeholder="Ukuran" required>
                                </div>
                                <div class="form-group">
                                    <label for="">Warna</label>
                                    <input type="text" class="form-control" name="warna" placeholder="Warna" required>
                                </div>
                                <div class="form-group">
                                    <label for="">Deskripsi</label>
                                    <textarea name="deskripsi" placeholder="Deskripsi" class="form-control" id="" cols="30" rows="10"
                                        required></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="">gambar</label>
                                    <input type="file" class="form-control" name="gambar">
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

            $.ajax({
                url: '/api/product',
                success: function({
                    data
                }) {
                    let row = '';
                    data.map(function(val, index) {
                        const namaKategori = val.category ? val.category.nama_kategori : '';
                        const namaSubkategori = val.subcategory ? val.subcategory.nama_subkategori : ''
                        row += `
               <tr>
                    <td>${index+1}</td>
                    <td>${namaKategori}</td>
                    <td>${namaSubkategori}</td>
                    <td>${val.nama_barang}</td>
                    <td>${val.harga}</td>
                    <td>${val.diskon}</td>
                    <td>${val.bahan}</td>
                    <td>${val.sku}</td>
                    <td>${val.ukuran}</td>
                    <td>${val.warna}</td>
                    <td><img src="/uploads/${val.gambar}" width="100"></td>
                    <td>
                        <a data-toggle-"modal" href"#modal-form" data-id="${val.id}" class="btn btn-warning modal-ubah">Edit</a>
                        <a href="#" data-id="${val.id}" class="btn btn-danger btn-hapus">hapus</a>
                    </td>
                </tr>
               
               `;
                    });
                    $('tbody').append(row)
                }
            })

            //hapus 
            $(document).on('click', '.btn-hapus', function() {
                const id = $(this).data('id');
                const token = localStorage.getItem('token');


                cconfirm_dialog = confirm('Apakah anda yakin?');

                if (cconfirm_dialog) {
                    $.ajax({
                        url: '/api/product/' + id,
                        type: "DELETE",
                        headers: {
                            "Authorization": token
                        },
                        success: function(data) {
                            if (data.message == 'success') {
                                alert('Data berhasil dihapus')
                                location.reload()
                            }
                        }
                    });
                }
            });
            //tambah
            $('.modal-tambah').click(function() {
                $('#modal-form').modal('show')
                $('select[name="nama_kategori]').val('')
                $('select[name="nama_subkategori]').val('')
                $('input[name="nama_barang" ]').val('')
                $('input[name="harga" ]').val('')
                $('input[name="diskon" ]').val('')
                $('input[name="bahan" ]').val('')
                $('input[name="tags" ]').val('')
                $('input[name="ukuran" ]').val('')
                $('input[name="warna" ]').val('')
                $('textarea[name="deskripsi" ]').val('')

                $('.form-barang').submit(function(e) {
                    e.preventDefault();
                    const token = localStorage.getItem('token');
                    const frmdata = new FormData(this);


                    $.ajax({
                        url: '/api/product',
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
                                alert('Data berhasil ditambah')
                                location.reload();
                            }
                        }

                    })
                });
            });
            //edit
            $(document).on('click', '.modal-ubah', function() {
                $('#modal-form').modal('show');
                const id = $(this).data('id');

                $.get('/api/product/' + id, function({
                    data
                }) {
                    $('input[name="nama_kategori"]').val(data.nama_kategori);
                    $('textarea[name="deskripsi" ]').val(data.deskripsi);
                });

                $('.form-barang').submit(function(e) {
                    e.preventDefault();
                    const token = localStorage.getItem('token');
                    const frmdata = new FormData(this);

                    $.ajax({
                        url: `/api/product/${id}?_method=PUT`,
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
