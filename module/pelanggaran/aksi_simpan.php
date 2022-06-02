<?php
    include "../../lib/config.php";
    include "../../lib/koneksi.php";

    //$idKatPelanggaran = $_POST['katPelanggaran'];
    $idSubKategori = $_POST['subKatPelanggaran'];
    $namaPelanggaran = $_POST['jenisPelanggaran'];
    $poin = $_POST['poin'];

    if ($poin > 0 && $poin<=125) {
        $querySimpan = mysqli_query($connect,"INSERT INTO pelanggaran (id_sub_katagori, nama_pelanggaran, poin) VALUES ('$idSubKategori', '$namaPelanggaran', '$poin')");

        $redirectSuccess = "main.php?module=pelanggaran";
        $redirectError = "main.php?module=tambah_pelanggaran";
        $validation = "main.php?module=tambah_pelanggaran";

        if ($querySimpan) {
            echo "<script> alert('Data Master Pelanggaran Berhasil Masuk'); window.location = '$base_url'+'$redirectSuccess';</script>";
        }
        else {
            echo "<script> alert('Data Master Pelanggaran Gagal Dimasukkan'); window.location = '$base_url'+'$redirectFailed';</script>";
        }
    }
    else{
        echo "<script> alert('Poin Tidak Boleh 0 atau Lebih Dari 125'); window.location = '$base_url'+'$validation';</script>";   
    }
?>
