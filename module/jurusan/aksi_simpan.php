<?php
    include "../../lib/config.php";
    include "../../lib/koneksi.php";

    $namaJurusan = $_POST['namaJurusan'];

    $querySimpan = mysqli_query($connect,"INSERT INTO jurusan (nama_jurusan) VALUES ('$namaJurusan')");

    $redirectSuccess = "main.php?module=jurusan";
	$redirectFailed = "main.php?module=tambah_jurusan";

    if ($querySimpan) {
        echo "<script> alert('Data Jurusan Berhasil Masuk'); window.location = '$base_url'+'$redirectSuccess';</script>";
    }
    else {
        echo "<script> alert('Data Jurusan Gagal Dimasukkan'); window.location = '$base_url'+'$redirectFailed';</script>";
    }

?>