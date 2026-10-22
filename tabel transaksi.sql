CREATE TABLE laporan (
  id_laporan INT AUTO_INCREMENT PRIMARY KEY,
  deskripsi_kerusakan TEXT NOT NULL,
  foto_bukti VARCHAR(255),
  tanggal_lapor DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  tingkat_urgensi ENUM('Rendah','Sedang','Tinggi') NOT NULL DEFAULT 'Sedang',
  id_pengguna INT NOT NULL,
  id_fasilitas INT NOT NULL,
