<?php
session_start();
if (empty($_SESSION['namauser']) AND empty($_SESSION['passuser'])) {

    echo "<center>untuk mengakses modul, anda harus login <br>";
    echo "<a href=../../index.php><b>LOGIN</b></a></center>";
} else {
    include "../../lib/koneksi.php";
    include "../../lib/config.php";
    
    $idPelanggaran = $_POST['idPelanggaran'];
    $idSubKategori = $_POST['subKatPelanggaran'];
    $namaPelanggaran = $_POST['jenisPelanggaran'];
    $poin = $_POST['poin'];
    
    $queryEdit = mysqli_query($connect,"UPDATE pelanggaran SET nama_pelanggaran ='$namaPelanggaran', id_sub_kategori='$idSubKategori', poin='$poin' WHERE id_pelanggaran='$idPelanggaran'" );

    $redirectSuccess = "main.php?module=pelanggaran";
    $redirectFailed = "main.php?module=edit_pelanggaran&id_pelanggaran=";

    if ($queryEdit) {
        echo "<script> alert ('Data Pelanggaran Berhasil Diubah'); window.location = '$base_url'+'$redirectSuccess';</script>";
    }
    else {
        echo "<script> alert('Data Pelanggaran Gagal Diubah'); window.location='$redirectFailed'+'$idPelanggaran';</script>";
    }
}
?>