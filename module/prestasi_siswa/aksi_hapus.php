<?php
session_start();
if (empty($_SESSION['namauser']) AND empty($_SESSION['passuser'])) {

	echo "<center>untuk mengakses modul, anda harus login <br>";
	echo "<a href=index.php><b>LOGIN</b></a></center>";
} else {
	include "../../lib/koneksi.php";
	include "../../lib/config.php";

	$idDetailPoin=$_GET['id_detail_poin'];
	$queryHapus=mysqli_query($connect,"DELETE FROM detail_poin WHERE id_detail_poin='$idDetailPoin'");
	
	$redirectSucces = "main.php?module=input_prestasi_siswa";
    $redirectFailed = "main.php?module=input_prestasi_siswa";

	if ($queryHapus) {
		echo "<script> alert('Data Prestasi Siswa Berhasil di Hapus'); window.location='$base_url'+'$redirectSuccess';</script>";
	}
	else {
		echo "<script> alert('Data Prestasi Siswa Gagal di Hapus'); window.location='$base_url'+'$redirectFailed';</script> ";
	}

	}
?>