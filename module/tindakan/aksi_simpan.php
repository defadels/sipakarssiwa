<?php
    include "../../lib/config.php";
    include "../../lib/koneksi.php";

    $namaTindakan = $_POST['namaTindakan'];
    $ketentuan = $_POST['ketentuan'];

    $querySimpan = mysqli_query($connect,"INSERT INTO tindakan (nama_tindakan, ketentuan) VALUES ('$namaTindakan', '$ketentuan')");

    $redirectSuccess = "main.php?module=tindakan";
	$redirectFailed = "main.php?module=tambah_tindakan";

    if ($querySimpan) {
        echo "<script> alert('Data Tindakan Berhasil Masuk'); window.location = '$base_url'+'$redirectSuccess';</script>";
    }
    else {
        echo "<script> alert('Data Tindakan Gagal Dimasukkan'); window.location = '$base_url'+'$redirectFailed';</script>";
    }

?>