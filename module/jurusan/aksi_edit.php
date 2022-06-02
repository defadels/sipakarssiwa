<?php
session_start();
if (empty($_SESSION['namauser']) AND empty($_SESSION['passuser'])) {

	echo "<center>untuk mengakses modul, anda harus login <br>";
	echo "<a href=../../index.php><b>LOGIN</b></a></center>";
} else {
	include "../../lib/koneksi.php";
	include "../../lib/config.php";
	
	$idJurusan = $_POST['idJurusan'];
	$namaJurusan = $_POST['namaJurusan'];
	
	$queryEdit = mysqli_query($connect,"UPDATE jurusan SET nama_jurusan ='$namaJurusan' WHERE id_jurusan='$idJurusan'" );

	$redirectSuccess = "main.php?module=jurusan";
	$redirectFailed = "main.php?module=edit_jurusan&id_jurusan=";

	if ($queryEdit) {
		echo "<script> alert ('Data Jurusan Berhasil Diubah'); window.location = '$base_url'+'$redirectSuccess';</script>";
	}
	else {
		echo "<script> alert('Data Jurusan Gagal Diubah'); window.location='$redirectFailed'+'$idJurusan';</script>";
	}
}
?>