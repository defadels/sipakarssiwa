<?php
    include "../../lib/config.php";
    include "../../lib/koneksi.php";

    $idJurusan = $_POST['jurusan'];
    $tingkatKelas = $_POST['tingkatKelas'];
    $subKelas = $_POST['subKelas'];
    $jmlSiswa = $_POST['jmlSiswa'];
    $waliKelas = $_POST['waliKelas'];
    $nip=substr($waliKelas, 0,18);


    $querySimpan = mysqli_query($connect,"INSERT INTO kelas (tingkat_kelas, id_jurusan, sub_kelas, nip, jml_siswa) VALUES ('$tingkatKelas', '$idJurusan', '$subKelas', '$nip', '$jmlSiswa')");

    $redirectSuccess = "main.php?module=kelas";
	$redirectFailed = "main.php?module=tambah_kelas";

    if ($querySimpan) {
        echo "<script> alert('Data Kelas Berhasil Masuk'); window.location = '$base_url'+'$redirectSuccess';</script>";
    }
    else {
        echo "<script> alert('Data Kelas Gagal Dimasukkan'); window.location = '$base_url'+'$redirectFailed';</script>";

    }

?>