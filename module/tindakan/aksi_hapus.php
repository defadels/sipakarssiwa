<?php
session_start();
if (empty($_SESSION['namauser']) AND empty($_SESSION['passuser'])) {

	echo "<center>untuk mengakses modul, anda harus login <br>";
	echo "<a href=../../index.php><b>LOGIN</b></a></center>";
} else {
	include "../../lib/koneksi.php";
	include "../../lib/config.php";

	$idTindakan=$_GET['id_tindakan'];
	$queryHapus=mysqli_query($connect,"DELETE FROM tindakan WHERE id_tindakan='$idTindakan'");

	$redirectSuccess = "main.php?module=tindakan";
	$redirectFailed = "main.php?module=tindakan";

	if ($queryHapus) {
		echo "<script> alert('Data Tindakan Berhasil di Hapus'); window.location='$base_url'+'$redirectSuccess';</script>";
	}
	else {
		echo "<script> alert('Data Tindakan Gagal di Hapus'); window.location='$base_url'+'$redirectFailed';</script> ";
	}

	}
?>