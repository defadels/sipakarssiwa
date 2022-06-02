-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 28, 2022 at 06:01 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pembinaan_karakter`
--
CREATE DATABASE `pembinaan_karakter` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pembinaan_karakter`;

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE IF NOT EXISTS `alumni` (
  `nis` varchar(6) NOT NULL,
  `nama_alumni` varchar(30) NOT NULL,
  `th_lulus` year(4) NOT NULL,
  `id_jurusan` tinyint(2) NOT NULL,
  `sub_kelas` char(1) NOT NULL,
  `id_ortu` int(5) NOT NULL,
  `alamat` text NOT NULL,
  PRIMARY KEY (`nis`),
  KEY `alumni_ibfk_1` (`id_jurusan`),
  KEY `alumni_ibfk_2` (`id_ortu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alumni`
--

INSERT INTO `alumni` (`nis`, `nama_alumni`, `th_lulus`, `id_jurusan`, `sub_kelas`, `id_ortu`, `alamat`) VALUES
('12345', 'Baim', 2017, 2, 'A', 2, 'medan, Sumut');

-- --------------------------------------------------------

--
-- Table structure for table `detail_poin`
--

CREATE TABLE IF NOT EXISTS `detail_poin` (
  `id_detail_poin` int(10) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `tahun_ajaran` char(9) NOT NULL,
  `nis` varchar(6) NOT NULL,
  `id_pelanggaran` tinyint(3) NOT NULL,
  `id_prestasi` tinyint(3) NOT NULL,
  `ket` text NOT NULL,
  PRIMARY KEY (`id_detail_poin`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `detail_poin`
--

INSERT INTO `detail_poin` (`id_detail_poin`, `tanggal`, `tahun_ajaran`, `nis`, `id_pelanggaran`, `id_prestasi`, `ket`) VALUES
(1, '2022-01-12', '2021/2022', '0001', 0, 1, 'Juara Umum'),
(2, '2022-04-21', '2022-2023', '00002', 0, 0, 'merokok'),
(3, '2022-05-09', '2022-2023', '00002', 0, 1, 'Juara 1'),
(4, '2022-05-09', '2022-2023', '00001', 0, 0, 'Terlambat Masuk'),
(5, '2022-05-09', '2022-2023', '00001', 0, 0, 'Terlambat');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE IF NOT EXISTS `guru` (
  `nip` char(18) NOT NULL,
  `nama_guru` varchar(30) NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  `jabatan` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`nip`, `nama_guru`, `no_hp`, `jabatan`) VALUES
('1234', 'Yuliani Enie', '080808080808', 'Guru Penjas'),
('123456', 'Enie Yuliani', '086432178932', 'Guru Matematika'),
('00987654', 'Anie', '089765123456', 'Wali Kelas');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE IF NOT EXISTS `jurusan` (
  `id_jurusan` tinyint(2) NOT NULL AUTO_INCREMENT,
  `nama_jurusan` varchar(50) NOT NULL,
  PRIMARY KEY (`id_jurusan`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
(1, 'Desain Pemodelan dan Informasi Bangunan'),
(2, 'Teknik Konstruksi Gedung, Sanitasi dan Perawatan'),
(3, 'Geologi Pertambangan');

-- --------------------------------------------------------

--
-- Table structure for table `kat_pelanggaran`
--

CREATE TABLE IF NOT EXISTS `kat_pelanggaran` (
  `id_kat_pelanggaran` tinyint(2) NOT NULL AUTO_INCREMENT,
  `nama_katagori` varchar(30) NOT NULL,
  PRIMARY KEY (`id_kat_pelanggaran`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `kat_pelanggaran`
--

INSERT INTO `kat_pelanggaran` (`id_kat_pelanggaran`, `nama_katagori`) VALUES
(1, 'Disiplin'),
(2, 'Kesopanan');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE IF NOT EXISTS `kelas` (
  `id_kelas` tinyint(3) NOT NULL AUTO_INCREMENT,
  `id_jurusan` tinyint(2) NOT NULL,
  `tingkat_kelas` varchar(4) NOT NULL,
  `sub_kelas` char(1) NOT NULL,
  `nip` char(18) DEFAULT NULL,
  `jml_siswa` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id_kelas`),
  KEY `kelas_ibfk_1` (`id_jurusan`),
  KEY `kelas_ibfk_2` (`nip`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `id_jurusan`, `tingkat_kelas`, `sub_kelas`, `nip`, `jml_siswa`) VALUES
(1, 1, 'X', 'A', '195802129001235743', 32),
(4, 2, 'XI', 'A', '195912036217893216', 32),
(5, 3, 'X', 'A', '196003242001032451', 32),
(7, 1, 'X', 'B', '195602120632179432', 32),
(8, 2, 'X', 'A', '196012210953218765', 32),
(10, 4, 'X', 'A', '196601182008012001', 32),
(11, 5, 'X', 'A', '197103072006042003', 32),
(12, 6, 'X', 'A', '197702098943217654', 32),
(13, 7, 'X', 'A', '197808102006042007', 32),
(14, 8, 'X', 'A', '198204262009022004', 32),
(15, 3, 'X', 'B', '196012124682345721', 32),
(16, 8, 'X', 'B', '196203252100021134', 32),
(17, 9, 'X', 'A', '195807072001021683', 32),
(18, 10, 'X', 'A', '195709282003126532', 32),
(19, 11, 'X', 'A', '196002112004001643', 32),
(20, 12, 'X', 'A', '196603042003017690', 32),
(21, 2, 'XII', 'A', '196601092002345123', 32),
(24, 2, 'XIII', 'A', '195003121212121212', 32),
(25, 1, 'X', 'A', '1234 - Yuliani Eni', 30),
(26, 1, 'X', 'A', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orang_tua`
--

CREATE TABLE IF NOT EXISTS `orang_tua` (
  `id_ortu` int(5) NOT NULL AUTO_INCREMENT,
  `nama_ortu` varchar(30) NOT NULL,
  `alamat_ortu` text NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  PRIMARY KEY (`id_ortu`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `orang_tua`
--

INSERT INTO `orang_tua` (`id_ortu`, `nama_ortu`, `alamat_ortu`, `no_hp`) VALUES
(1, 'Bunga Citra Lestari', 'Yogyakarta', '098764374251'),
(2, 'Krisdayanti', 'Bantul, Yogyakarta', '089999999999'),
(3, 'Chucky', 'Condong Catur, Depok, Sleman, Yogyakarta', '086666666666'),
(4, 'Ridwan Asrori', 'Ngemplak, Sleman Yogyakarta', '083866304002'),
(5, 'HM Aris', 'Grembyangan, Madurejo, Prambanan, Sleman', '0811294783'),
(6, 'Yudha Yumayana', 'Giwangan, Yogyakarta', '085647021807'),
(7, 'Wachid Cahyadi', 'Kramen, Sidoagung, Godean, Sleman, Yogyakarta', '087835312932'),
(8, 'Rahmat Hakim', 'Tumut, Sumbersari, Moyudan, Sleman', '08564021804'),
(9, 'Ridwan', 'Balong, Umbulharjo, Cangkringan, Sleman', '085728000422'),
(10, 'Aris Joko Saraswo', 'Jl. Raya Condet No. 55 Kec. Pasar Rebo, Jakarta Timur', '085728054444'),
(11, 'Bambang', 'Perumahan Griya Kencan Permai, Argorejo, Sedayu, Bantul\r\n', ''),
(12, 'Anton Tedda', 'Karanggayam, Sitimulyo, Piyungan, Bantul, Yogyakarta', '081567629043'),
(13, 'Herry Wicaksono', 'Perum Jambusari Indah, Wedomartani, Ngemplak, Sleman, Yogyakarta', '081393937071'),
(14, 'Ratno hermawan', 'Buyutan, Banyurejo, Tempel, Sleman', '085229624162'),
(15, 'Makmur Amin', 'Banyon, Pendowoharjo, Sewo, Bantul', '085642353664'),
(16, 'Michael Christianto', 'Pugeran, Maguwoharjo, Depok, Sleman', '081225927888'),
(17, 'Arief Rahman', 'Sawungsari, Hargobinangun, Pakem', '081548515774'),
(18, 'Basworo Dibyo', 'Candirejo, Sardonoharjo, Ngaglik, Sleman', '081393365787'),
(19, 'Dodiek Hari', 'Kaliurang Barat, Hargobinangun, Pakem', '081288046553'),
(20, 'N Wicaksono KP', 'Gorongan No. 153, Condong Catur, Depok, Sleman', '085643870947'),
(21, 'Randy', 'Juragan, Sidoluhur, Godean, Sleman', '08156704040'),
(22, 'S. Budi Santoso', 'Jowah, Sidoluhur, Godean, Sleman', '0811327546'),
(23, 'Hadi Sumarsono', 'Perum Bukit Permata, Candi Gebang, Sleman', '081218765349'),
(24, 'Teguh Sumampaw', 'Plemburan, Sariharjo, Ngaglik, Sleman', '08122638778'),
(25, 'Riszki Gunawan', 'Pakisaji, Candibinangun, Pakem', '08812960156'),
(26, 'Rian Sofyan', 'Prokerten, Trimurti, Srandakan, Bantul', '081393358287'),
(27, 'Ali Wijaya', 'Gatak, Sidoluhur, Godean, Sleman', '08122588007'),
(28, 'Satromo', 'Jurugan, Bangunkerto, Turi, Sleman', '085281961396'),
(29, 'Wakik', 'Dadapan Pinggir, Sidomulyo, Bambanglipuro, Bantul', '085281961396'),
(30, 'Anyari', 'Kwangen, Argomulyo, Cangkringan, Sleman', '085281961396'),
(31, 'Abu Hasan', 'Sembego, Depok, Sleman, Yogyakarta', '085235950990'),
(32, 'Isbandi', 'Jl. Swelobumi No. 03 Pringgolayan, Dabag, Condongcatur, Depok, Sleman', '082331983841'),
(33, 'Abdus Salam', 'Ngentak, Umbulharjo, Ngemplak, Sleman', '082234422140'),
(34, 'Jumali', 'Sambilegi Baru, Maguwoharjo, Depok, Sleman', '085257592582'),
(35, 'Kusnadi', 'Banteng, Hargobinangun, Pakem, Sleman', '085281961396'),
(36, 'Didit', 'Payangan Utara, Girirejo, Imogri, Bantul', '085281961396'),
(37, 'Untung', 'Pugeran, Maguwoharjo, Depok, Sleman', '085281961396'),
(38, 'Junaidi', 'Karanglo, Purwomartani, Kalasan, Sleman', '085281961396'),
(39, 'Amas Yunus', 'Krapyak, Wedomartani, Ngemplak, Sleman', '08154701609'),
(40, 'Eddy Machmud', 'Perum Lojajar Indah, Ngaglik, Sleman', '08123942158'),
(41, 'Riza Falepi', 'Jl. Teratai, Perum Concat, Sleman', '0811888039'),
(42, 'Bubun Budiawan', 'Kradenan, Girirejo, Imogiri, Bantul', '081321117604'),
(43, 'Haris Mulyana', 'Jl. Nogomudo No. 293, Gowok, Depok, Sleman', '081221495162'),
(44, 'Slamet Riyadi', 'Tegalngijon, Sumberagung, Moyudan, Sleman', '081321929302');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggaran`
--

CREATE TABLE IF NOT EXISTS `pelanggaran` (
  `id_pelanggaran` tinyint(3) NOT NULL AUTO_INCREMENT,
  `nama_pelanggaran` varchar(150) NOT NULL,
  `id_sub_katagori` tinyint(2) NOT NULL,
  `poin` tinyint(3) NOT NULL,
  PRIMARY KEY (`id_pelanggaran`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pelanggaran`
--

INSERT INTO `pelanggaran` (`id_pelanggaran`, `nama_pelanggaran`, `id_sub_katagori`, `poin`) VALUES
(1, '-', 1, 75);

-- --------------------------------------------------------

--
-- Table structure for table `prestasi`
--

CREATE TABLE IF NOT EXISTS `prestasi` (
  `id_prestasi` tinyint(3) NOT NULL AUTO_INCREMENT,
  `nama_prestasi` varchar(100) NOT NULL,
  `poin` smallint(3) NOT NULL,
  PRIMARY KEY (`id_prestasi`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `prestasi`
--

INSERT INTO `prestasi` (`id_prestasi`, `nama_prestasi`, `poin`) VALUES
(1, 'Karate', 90),
(2, 'Sepak Bola', 90);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE IF NOT EXISTS `siswa` (
  `nis` varchar(6) NOT NULL,
  `nama_siswa` varchar(30) NOT NULL,
  `th_angkatan` year(4) NOT NULL,
  `alamat` text NOT NULL,
  `id_kelas` tinyint(3) NOT NULL,
  `id_ortu` int(5) NOT NULL,
  PRIMARY KEY (`nis`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama_siswa`, `th_angkatan`, `alamat`, `id_kelas`, `id_ortu`) VALUES
('00001', 'Sari', 2021, 'Medan Tembung', 1, 1),
('00002', 'ummi', 2020, 'jalan udang', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `siswa_do`
--

CREATE TABLE IF NOT EXISTS `siswa_do` (
  `nis` varchar(6) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `th_keluar` year(4) NOT NULL,
  `id_jurusan` tinyint(2) NOT NULL,
  PRIMARY KEY (`nis`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa_do`
--


-- --------------------------------------------------------

--
-- Table structure for table `sub_kat_pelanggaran`
--

CREATE TABLE IF NOT EXISTS `sub_kat_pelanggaran` (
  `id_sub_katagori` tinyint(2) NOT NULL AUTO_INCREMENT,
  `nama_sub_katagori` varchar(100) NOT NULL,
  `id_kat_pelanggaran` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_sub_katagori`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sub_kat_pelanggaran`
--

INSERT INTO `sub_kat_pelanggaran` (`id_sub_katagori`, `nama_sub_katagori`, `id_kat_pelanggaran`) VALUES
(1, 'Terlambat', 1),
(2, 'Merokok', 2);

-- --------------------------------------------------------

--
-- Table structure for table `temp_rapat`
--

CREATE TABLE IF NOT EXISTS `temp_rapat` (
  `id_temp_rapat` int(12) NOT NULL AUTO_INCREMENT,
  `nis` varchar(6) NOT NULL,
  `jml_poin_pelanggaran` smallint(3) NOT NULL,
  `lihat` char(1) NOT NULL,
  PRIMARY KEY (`id_temp_rapat`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `temp_rapat`
--


-- --------------------------------------------------------

--
-- Table structure for table `temp_sp_1`
--

CREATE TABLE IF NOT EXISTS `temp_sp_1` (
  `id_temp_sp_1` int(12) NOT NULL AUTO_INCREMENT,
  `nis` varchar(6) NOT NULL,
  `jml_poin_pelanggaran` smallint(3) NOT NULL,
  `lihat` char(1) NOT NULL,
  PRIMARY KEY (`id_temp_sp_1`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `temp_sp_1`
--


-- --------------------------------------------------------

--
-- Table structure for table `temp_sp_2`
--

CREATE TABLE IF NOT EXISTS `temp_sp_2` (
  `id_temp_sp_2` int(12) NOT NULL AUTO_INCREMENT,
  `nis` varchar(6) NOT NULL,
  `jml_poin_pelanggaran` smallint(3) NOT NULL,
  `lihat` char(1) NOT NULL,
  PRIMARY KEY (`id_temp_sp_2`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `temp_sp_2`
--


-- --------------------------------------------------------

--
-- Table structure for table `temp_sp_3`
--

CREATE TABLE IF NOT EXISTS `temp_sp_3` (
  `id_temp_sp_3` int(11) NOT NULL AUTO_INCREMENT,
  `nis` int(11) NOT NULL,
  `jml_poin_pelanggaran` int(11) NOT NULL,
  `lihat` int(11) NOT NULL,
  PRIMARY KEY (`id_temp_sp_3`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `temp_sp_3`
--


-- --------------------------------------------------------

--
-- Table structure for table `th_ajaran`
--

CREATE TABLE IF NOT EXISTS `th_ajaran` (
  `id_th_ajaran` mediumint(5) NOT NULL AUTO_INCREMENT,
  `tahun_ajaran` char(9) NOT NULL,
  `sekarang` char(1) NOT NULL,
  PRIMARY KEY (`id_th_ajaran`),
  UNIQUE KEY `tahun_ajaran` (`tahun_ajaran`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `th_ajaran`
--

INSERT INTO `th_ajaran` (`id_th_ajaran`, `tahun_ajaran`, `sekarang`) VALUES
(1, '2022-2023', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tindakan`
--

CREATE TABLE IF NOT EXISTS `tindakan` (
  `id_tindakan` tinyint(3) NOT NULL AUTO_INCREMENT,
  `nama_tindakan` varchar(30) NOT NULL,
  `ketentuan` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tindakan`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tindakan`
--

INSERT INTO `tindakan` (`id_tindakan`, `nama_tindakan`, `ketentuan`) VALUES
(1, 'Hukuman', 'lari 10 kali putaran'),
(2, 'pangkas rambur', 'di botak');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_login` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `password` text NOT NULL,
  `nip` char(18) DEFAULT NULL,
  `nis` varchar(6) DEFAULT NULL,
  `id_ortu` int(5) DEFAULT NULL,
  `hak_akses` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_login`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_login`, `username`, `password`, `nip`, `nis`, `id_ortu`, `hak_akses`) VALUES
(1, 'admin', 'admin', '', '12345', 0, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
