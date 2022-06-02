<?php
    include "../../lib/config.php";
    include "../../lib/koneksi.php";

    $namaKatPelanggaran = $_POST['namaKatPelanggaran'];

    $querySimpan = mysqli_query($connect,"INSERT INTO kat_pelanggaran (nama_katagori) VALUES ('$namaKatPelanggaran')");

    $redirectSuccess = "main.php?module=kat_pelanggaran";
	$redirectFailed = "main.php?module=tambah_kat_pelanggaran";

    if ($querySimpan) {
        echo "<script> alert('Data Kategori Berhasil Masuk'); window.location = '$base_url'+'$redirectSuccess';</script>";
    }
    else {
        echo "<script> alert('Data Kategori Gagal Dimasukkan'); window.location = '$base_url'+'$redirectFailed';</script>";
    }

?>