<?php
session_start();
if (empty($_SESSION['namauser']) AND empty($_SESSION['passuser'])) {

	echo "<center>untuk mengakses modul, anda harus login <br>";
	echo "<a href=../../index.php><b>LOGIN</b></a></center>";
} else {
	include "../../lib/koneksi.php";
	include "../../lib/config.php";
	
	$idKategori = $_POST['idKatPelanggaran'];
	$namaKategori = $_POST['namaKatPelanggaran'];
	
	$queryEdit = mysqli_query($connect,"UPDATE kat_pelanggaran SET nama_katagori ='$namaKategori' WHERE id_kat_pelanggaran='$idKategori'" );

	$redirectSuccess = "main.php?module=kat_pelanggaran";
	$redirectFailed = "main.php?module=edit_kat_pelanggaran&id_kat_pelanggaran=";

	if ($queryEdit) {
		echo "<script> alert ('Data Kategori Berhasil Diubah'); window.location = '$base_url'+'$redirectSuccess';</script>";
	}
	else {
		echo "<script> alert('Data Kategori Gagal Diubah'); window.location='$redirectFailed'+'$idKategori';</script>";
	}
}
?>