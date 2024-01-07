-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2024 at 07:44 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poliklinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daftar_poli`
--

INSERT INTO `daftar_poli` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`, `tanggal`) VALUES
(11, 11, 2, 'dddddddddddd', 1, '2024-01-05 14:27:46'),
(12, 17, 2, 'Sakit Gigi', 2, '2024-01-05 18:28:42'),
(13, 11, 9, 'Sesak Napas', 1, '2024-01-05 18:36:12'),
(14, 12, 8, 'Suka Kaget', 1, '2024-01-05 18:36:40'),
(15, 13, 7, 'Mual', 1, '2024-01-05 18:37:02'),
(16, 17, 3, 'ttt\r\n', 1, '2024-01-07 08:12:22'),
(17, 16, 5, 'Gusi bengkak ', 1, '2024-01-07 08:14:24'),
(18, 11, 8, 'Sakit ', 2, '2024-01-07 08:21:17'),
(19, 11, 4, 'vv', 1, '2024-01-07 08:21:55'),
(20, 23, 2, 'qqq', 3, '2024-01-07 08:32:23'),
(21, 11, 2, 'Gusi Bengkak', 4, '2024-01-07 08:41:27'),
(22, 12, 3, 'Demam Tinggi', 2, '2024-01-07 08:41:58'),
(23, 13, 7, 'Mual dan Pusing', 2, '2024-01-07 08:42:26'),
(24, 16, 11, 'Operasi Kista', 1, '2024-01-07 08:42:55'),
(25, 17, 12, 'Jantung Lemah', 1, '2024-01-07 08:43:31'),
(26, 23, 9, 'Sesak Nafas', 2, '2024-01-07 08:43:56'),
(27, 17, 4, 'Demam Tinggi', 2, '2024-01-07 08:45:02'),
(28, 24, 7, 'Mual', 3, '2024-01-07 08:47:58'),
(29, 17, 5, 'Gigi Berlubang', 2, '2024-01-07 08:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(11) NOT NULL,
  `id_periksa` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(6, 7, 7),
(7, 8, 13),
(8, 9, 13),
(9, 10, 13);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `id_poli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `alamat`, `no_hp`, `id_poli`) VALUES
(8, 'Mewah Aprilia Susyanti', 'Tegal', '0895383243075', 7),
(11, 'Rahmaisya Intan Damayanti', 'Tegal', '0895383243076', 8),
(13, 'Mercy Adi Pratama', 'Tegal', '0895383243077', 9),
(14, 'Sofya Zahro Tunisa', 'Tegal', '0895383243078', 10),
(15, 'Siti Arofah', 'Tegal', '0895383243079', 11),
(16, 'Zahrotul Fuadah', 'Tegal', '0895383243070', 12);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`) VALUES
(2, 8, 'Selasa', '01:11:31', '10:07:15'),
(3, 11, 'Senin', '09:00:00', '12:00:00'),
(4, 11, 'Kamis', '12:30:00', '15:00:00'),
(5, 8, 'Rabu', '07:00:00', '09:00:00'),
(6, 8, 'Sabtu', '15:00:00', '18:00:00'),
(7, 13, 'Jumat', '07:00:00', '09:00:00'),
(8, 15, 'Selasa', '15:00:00', '18:00:00'),
(9, 16, 'Sabtu', '07:00:00', '09:00:00'),
(10, 14, 'Selasa', '15:00:00', '18:00:00'),
(11, 14, 'Kamis', '18:00:00', '20:00:00'),
(12, 15, 'Rabu', '18:00:00', '20:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `kemasan` varchar(50) NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(7, 'Paramex', 'Strip', 5000),
(8, 'Pedilax', 'Strip', 26200),
(9, 'Mixagrip', 'Strip', 3200),
(10, 'Metrix', 'Strip', 100000),
(11, 'Truvaz', 'Strip', 222000),
(12, 'Antimo ', 'Tablet', 3200),
(13, 'Amoxicillin Syr', 'Botol', 38000),
(14, 'Ascomin', 'Botol', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `no_rm` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `alamat`, `no_ktp`, `no_hp`, `no_rm`) VALUES
(11, 'Ikmah', 'Jl. Durian no.20, Dukuhwaru', '3328185904020002', '0895485389053', '202401-4'),
(12, 'Sasa', 'Jl. Belimbing no.46, Dukuhwaru', '3328185904020003', '0895485389054', '202401-5'),
(13, 'Lisa', 'Jl. Pisang no.06, Dukuhwaru', '3328185904020004', '0895485389055', '202401-6'),
(16, 'Yanti', 'Jl. Semangka no.19, Dukuhwaru', '3328185904020007', '0895485389058', '202401-9'),
(17, 'Ugi', 'Jl. Nangka no.18, Dukuhwaru', '3328185904020008', '0895485389059', '202401-10'),
(23, 'Ihsan', 'Jl. Mangga no.11, Dukuhwaru', '3328185904020009', '0895485389050', '202401-8'),
(24, 'Ilham', 'Jl. Mangga no.11, Dukuhwaru', '3328185904020001', '0895485389051', '202401-7');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id` int(11) NOT NULL,
  `id_daftar_poli` int(11) NOT NULL,
  `tgl_periksa` datetime NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id`, `id_daftar_poli`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(7, 22, '2024-01-07 09:57:40', 'Istirahat yang cukup', 155000),
(8, 21, '2024-01-07 10:00:01', 'Jangan Minum Es', 188000),
(9, 29, '2024-01-07 10:00:43', 'Jangan Makan Manis', 188000),
(10, 12, '2024-01-07 10:01:26', 'Kurangi Es', 188000);

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id` int(11) NOT NULL,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`) VALUES
(7, 'Poli Gigi', 'Menyediakan perawatan gigi dan mulut, termasuk pemeriksaan gigi, pembersihan, perawatan gigi, dan prosedur bedah gigi.'),
(8, 'Poli Anak', 'Menyediakan pelayanan kesehatan anak-anak, termasuk pemeriksaan rutin, imunisasi, dan penanganan masalah kesehatan anak.'),
(9, 'Poli Kandungan dan Obstet', 'Menangani perawatan kesehatan reproduksi wanita, seperti pemeriksaan kandungan, pemantauan kehamilan, dan persalinan.'),
(10, 'Poli Bedah', 'Menyediakan konsultasi dan perawatan untuk masalah yang memerlukan intervensi bedah, baik yang bersifat elektif maupun mendesak.'),
(11, 'Poli Jantung', 'Menyediakan pelayanan kesehatan kardiologi, termasuk pemeriksaan jantung, manajemen penyakit jantung, dan rehabilitasi jantung.'),
(12, 'Poli Paru', 'Menyediakan pelayanan kesehatan untuk masalah pernapasan dan penyakit paru, seperti asma, bronkitis, dan pneumonia.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(6, 'admin', '$2y$10$BrKMzQaT8vMMFmUzhEwVFurjtsLAD1Ej9jGtpA9R/k1HeRH6C.oV6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pasien_daftar_poli` (`id_pasien`),
  ADD KEY `fk_jadwal_periksa_daftar_poli` (`id_jadwal`);

--
-- Indexes for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detail_periksa_obat` (`id_obat`),
  ADD KEY `fk_periksa_detail_periksa` (`id_periksa`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dokter_poli` (`id_poli`);

--
-- Indexes for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jadwal_periksa_dokter` (`id_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_daftar_poli_periksa` (`id_daftar_poli`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `fk_jadwal_periksa_daftar_poli` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksa` (`id`),
  ADD CONSTRAINT `fk_pasien_daftar_poli` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`);

--
-- Constraints for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `fk_detail_periksa_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `fk_periksa_detail_periksa` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_dokter_poli` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id`);

--
-- Constraints for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `fk_jadwal_periksa_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `fk_daftar_poli_periksa` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
