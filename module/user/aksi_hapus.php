<?php
session_start();
if (empty($_SESSION['namauser']) AND empty($_SESSION['passuser'])) {

	echo "<center>untuk mengakses modul, anda harus login <br>";
	echo "<a href=../../index.php><b>LOGIN</b></a></center>";
} else {
	include "../../lib/koneksi.php";
	include "../../lib/config.php";

	$idLogin=$_GET['id_login'];
	$queryHapus=mysqli_query($connect,"DELETE FROM user WHERE id_login='$idLogin'");

	$redirectSuccess = "main.php?module=user";
	$redirectFailed = "main.php?module=user";

	if ($queryHapus) {
		echo "<script> alert('Data User Berhasil di Hapus'); window.location='$base_url'+'$redirectSuccess';</script>";
	}
	else {
		echo "<script> alert('Data User Gagal di Hapus'); window.location='$base_url'+'$redirectFailed';</script> ";
	}

	}
?>