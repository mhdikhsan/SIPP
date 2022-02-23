-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2018 at 06:23 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `puswil`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `nip_pegawai` varchar(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `nama_pegawai` varchar(50) NOT NULL,
  `telp_pegawai` varchar(50) NOT NULL,
  `email_pegawai` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`nip_pegawai`, `username`, `password`, `nama_pegawai`, `telp_pegawai`, `email_pegawai`) VALUES
('a-001', 'Ikhsan', '123', 'Muhammad ikhsan ', '12314', 'ikhsanmhd12@gmail.com'),
('a-002', 'gema', '123', 'Gema', '-', '-');

-- --------------------------------------------------------

--
-- Table structure for table `data_anggota`
--

CREATE TABLE `data_anggota` (
  `id_anggota` varchar(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis_kelamin` varchar(11) NOT NULL,
  `status` varchar(11) NOT NULL,
  `masa_berlaku` varchar(11) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_buku`
--

CREATE TABLE `data_buku` (
  `id_buku` varchar(11) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `pengarang` varchar(250) NOT NULL,
  `th_terbit` varchar(4) NOT NULL,
  `penerbit` varchar(11) NOT NULL,
  `isbn` varchar(25) NOT NULL,
  `kategori` varchar(11) NOT NULL,
  `jumlah_buku` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_buku`
--

INSERT INTO `data_buku` (`id_buku`, `judul`, `pengarang`, `th_terbit`, `penerbit`, `isbn`, `kategori`, `jumlah_buku`) VALUES
('BK-001', 'Pemrograman Bergerak', 'Nasrudin Syafaat', '2009', 'IT-01', 'ISBN-BK-001', 'P-01', 10),
('BK-0021', 'Tes', 'tes', 'tes', 'GN-01', '12313123', 'K-01', 25);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kode_kategori` varchar(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kode_kategori`, `nama_kategori`) VALUES
('K-01', 'Kebudayaan'),
('N-01', 'Novel'),
('P-01', 'Pendidikan'),
('S-01', 'Sastra'),
('S-02', 'Sosial'),
('S-03', 'Sains'),
('U-01', 'Umum');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` varchar(11) NOT NULL DEFAULT '',
  `id_anggota` varchar(11) DEFAULT NULL,
  `id_buku` varchar(11) DEFAULT NULL,
  `tgl_peminjaman` date DEFAULT NULL,
  `batas_pinjam` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `kode_penerbit` varchar(11) NOT NULL,
  `penerbit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`kode_penerbit`, `penerbit`) VALUES
('ER-01', 'Erlangga'),
('GN-01', 'Ganesha'),
('IF-01', 'Informatika'),
('IT-01', 'Informatika'),
('MI-01', 'Mizan'),
('QT-01', 'Quantum');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id` int(11) NOT NULL,
  `id_peminjaman` varchar(11) DEFAULT NULL,
  `batas_pinjam` varchar(50) NOT NULL,
  `tgl_kembali` varchar(50) DEFAULT NULL,
  `id_anggota` varchar(11) NOT NULL,
  `id_buku` varchar(11) NOT NULL,
  `denda` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`nip_pegawai`);

--
-- Indexes for table `data_anggota`
--
ALTER TABLE `data_anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `data_buku`
--
ALTER TABLE `data_buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `fk_idpenerbit` (`penerbit`),
  ADD KEY `fk_idkategori` (`kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kode_kategori`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `fk_idanggota` (`id_anggota`),
  ADD KEY `fk_idbuku` (`id_buku`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`kode_penerbit`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_idpinjam` (`id_peminjaman`),
  ADD KEY `fk_idaggt` (`id_anggota`),
  ADD KEY `fk_idbk` (`id_buku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_buku`
--
ALTER TABLE `data_buku`
  ADD CONSTRAINT `fk_idkategori` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`kode_kategori`),
  ADD CONSTRAINT `fk_idpenerbit` FOREIGN KEY (`penerbit`) REFERENCES `penerbit` (`kode_penerbit`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `fk_idanggota` FOREIGN KEY (`id_anggota`) REFERENCES `data_anggota` (`id_anggota`),
  ADD CONSTRAINT `fk_idbuku` FOREIGN KEY (`id_buku`) REFERENCES `data_buku` (`id_buku`);

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `fk_idaggt` FOREIGN KEY (`id_anggota`) REFERENCES `data_anggota` (`id_anggota`),
  ADD CONSTRAINT `fk_idbk` FOREIGN KEY (`id_buku`) REFERENCES `data_buku` (`id_buku`),
  ADD CONSTRAINT `fk_idpinjam` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id_peminjaman`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
