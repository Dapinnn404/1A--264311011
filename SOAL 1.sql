-- Tabel Transaksi: Laporan
CREATE TABLE laporan (
  id_laporan INT AUTO_INCREMENT PRIMARY KEY,
  deskripsi_kerusakan TEXT NOT NULL,
  foto_bukti VARCHAR(255),
  tanggal_lapor DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  tingkat_urgensi ENUM('Rendah','Sedang','Tinggi') NOT NULL DEFAULT 'Sedang',
  id_pengguna INT NOT NULL,
  id_fasilitas INT NOT NULL,

-- Tabel Induk 1: Gedung
CREATE TABLE gedung (
  id_gedung    INT AUTO_INCREMENT PRIMARY KEY,
  nama_gedung  VARCHAR(100) NOT NULL,
  lokasi       VARCHAR(150)
) ENGINE=InnoDB;

-- Tabel Induk 2: Pengguna
CREATE TABLE pengguna (
  id_pengguna     INT AUTO_INCREMENT PRIMARY KEY,
  nama_pengguna   VARCHAR(100) NOT NULL,
  nomor_pengenal  VARCHAR(30)  NOT NULL UNIQUE,
  peran           ENUM('Mahasiswa','Dosen','Tendik') NOT NULL,
  UNIQUE KEY uq_pengguna_peran (id_pengguna, peran)
) ENGINE=InnoDB;
