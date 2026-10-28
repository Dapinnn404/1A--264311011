---Alasan Bisnis---
---Sistem pelaporan kerusakan fasilitas kampus dibuat untuk mempermudah mahasiswa, dosen, dan staf dalam melaporkan fasilitas kampus yang rusak atau membutuhkan perbaikan. 
---Dengan adanya sistem ini, pihak pengelola kampus dapat menerima laporan secara terstruktur, mengetahui lokasi kerusakan dengan lebih mudah, serta memantau proses perbaikan fasilitas.
---Selain itu, sistem ini membantu mengurangi risiko laporan yang terlewat atau tercatat berulang kali. 
---Data laporan dapat digunakan sebagai bahan evaluasi untuk menentukan prioritas perbaikan, meningkatkan efisiensi pemeliharaan fasilitas, dan menjaga kenyamanan serta keamanan lingkungan kampus.

---Analisis Normalisasi---
---1. Bentuk Tidak Normal (UNF)
---Pada bentuk awal, seluruh informasi laporan dapat disimpan dalam satu tabel, seperti data pelapor, lokasi kerusakan, fasilitas yang rusak, dan informasi perbaikan.
---Contoh atribut:
--- ID_Laporan
--- Nama_Pelapor
--- NIM
--- Nama_Gedung
--- Nomor_Lantai
--- Nama_Ruangan
--- Nama_Fasilitas
--- Deskripsi_Kerusakan
--- Tanggal_Laporan
--- Status_Laporan
---Permasalahan: data pelapor dan lokasi akan berulang apabila orang yang sama membuat beberapa laporan atau beberapa kerusakan terjadi di lokasi yang sama.
---2. Bentuk Normal Pertama (1NF)
---Tabel memenuhi 1NF apabila setiap kolom berisi satu nilai yang bersifat atomik dan tidak terdapat kelompok data berulang.

---Contoh struktur tabel laporan:
---ID_Laporan	Nama_Pelapor	Nama_Ruangan	Nama_Fasilitas	Status
---1	Andi	Ruang 101	Proyektor	Menunggu
---2	Andi	Ruang 101	Lampu	Diproses

---Setiap kolom hanya menyimpan satu nilai. Namun, nama pelapor dan lokasi masih berpotensi mengalami pengulangan.
---3. Bentuk Normal Kedua (2NF)
---Tabel memenuhi 2NF apabila sudah memenuhi 1NF dan setiap atribut non-key bergantung sepenuhnya pada primary key.

---Untuk mengurangi pengulangan data, informasi dipisahkan menjadi beberapa tabel:
--- Tabel pelapor: id_pelapor (PK), nama_pelapor, nim
--- Tabel lokasi: id_lokasi (PK), nama_gedung, nomor_lantai, nama_ruangan, keterangan_lokasi
--- Tabel laporan: id_laporan (PK), id_pelapor (FK), id_lokasi (FK), nama_fasilitas, deskripsi_kerusakan, tanggal_laporan, status_laporan

---Dengan pemisahan tersebut, data pelapor dan lokasi tidak perlu ditulis berulang kali secara lengkap dalam setiap laporan.
---4. Bentuk Normal Ketiga (3NF)
---Tabel memenuhi 3NF apabila sudah memenuhi 2NF dan tidak terdapat ketergantungan transitif, yaitu atribut non-key bergantung pada atribut non-key lainnya.

---DDL---
--Create table
CREATE TABLE lokasi (
    id_lokasi INT AUTO_INCREMENT PRIMARY KEY,
    nama_gedung VARCHAR(100) NOT NULL,
    nomor_lantai INT NOT NULL,
    nama_ruangan VARCHAR(100) NOT NULL,
    keterangan_lokasi TEXT
);

--Trigger
DELIMITER //

CREATE TRIGGER cek_lokasi_insert
BEFORE INSERT ON lokasi
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM lokasi
        WHERE nama_gedung = NEW.nama_gedung
          AND nomor_lantai = NEW.nomor_lantai
          AND nama_ruangan = NEW.nama_ruangan
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Lokasi sudah terdaftar dan tidak boleh duplikat!';
    END IF;
END //

DELIMITER ;

---Data Awal---
INSERT INTO lokasi
    (nama_gedung, nomor_lantai, nama_ruangan, keterangan_lokasi)
VALUES
    ('Gedung A', 1, 'Ruang 101', 'Ruang kelas'),
    ('Gedung A', 1, 'Ruang 102', 'Ruang kelas'),
    ('Gedung A', 2, 'Lab Komputer', 'Laboratorium komputer'),
    ('Gedung B', 1, 'Toilet Pria', 'Toilet dekat tangga'),
    ('Gedung B', 1, 'Toilet Wanita', 'Toilet dekat tangga'),
    ('Gedung C', 3, 'Ruang 305', 'Ruang kelas'),
    ('Gedung C', 2, 'Ruang Dosen', 'Ruang kerja dosen');

