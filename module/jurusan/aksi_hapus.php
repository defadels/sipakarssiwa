<?php
session_start();
if (empty($_SESSION['namauser']) AND empty($_SESSION['passuser'])) {

	echo "<center>untuk mengakses modul, anda harus login <br>";
	echo "<a href=../../index.php><b>LOGIN</b></a></center>";
} else {
	include "../../lib/koneksi.php";
	include "../../lib/config.php";

	$idJurusan=$_GET['id_jurusan'];
	$queryHapus=mysqli_query($connect,"DELETE FROM jurusan WHERE id_jurusan='$idJurusan'");

	$redirectSuccess = "main.php?module=jurusan";
	$redirectFailed = "main.php?module=jurusan";

	if ($queryHapus) {
		echo "<script> alert('Data Jurusan Berhasil di Hapus'); window.location='$base_url'+'$redirectSuccess';</script>";
	}
	else {
		echo "<script> alert('Data Jurusan Gagal di Hapus'); window.location='$base_url'+'$redirectFailed';</script> ";
	}

	}
?>