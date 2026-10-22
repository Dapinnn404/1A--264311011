-- 1. Dummy Tabel Transaksi: Laporan (3 baris)
INSERT INTO laporan (deskripsi_kerusakan, tingkat_urgensi, id_pengguna, id_fasilitas) VALUES 
('AC tidak dingin dan bocor air', 'Tinggi', 1, 1),
('Proyektor buram dan berkedip', 'Sedang', 2, 2),
('Sandaran kursi patah', 'Rendah', 3, 3);


-- 2. Dummy Tabel Induk: Pengguna (3 baris)
INSERT INTO pengguna (nama_pengguna, nomor_pengenal, email, peran) VALUES
('Beni', '264311001', 'beni@pnm.ac.id', 'Mahasiswa'),
('Udin', '198001012005012001', 'udin@pnm.ac.id', 'Dosen'),
('Lani', '264311005', 'lani@pnm.ac.id', 'Mahasiswa');


-- 3. Dummy Tabel Induk: Gedung (3 baris)
INSERT INTO fasilitas (nama_fasilitas, kode_qr, id_ruangan) VALUES 
('AC Split 1 PK', 'QR-001', 1),
('Proyektor Epson', 'QR-002', 1),
('Kursi Kuliah', 'QR-003', 2);


-- =====================================================
-- [READ] Tampilkan seluruh isi salah satu Tabel Induk
-- =====================================================
SELECT * FROM fasilitas;

-- =====================================================
-- [UPDATE] Ubah satu nilai data pada Tabel Transaksi dengan WHERE pada Primary Key
-- =====================================================
UPDATE laporan 
SET tingkat_urgensi = 'Tinggi' 
WHERE id_laporan = 2;

-- =====================================================
-- [DELETE] Hapus salah satu baris data dummy pada Tabel Transaksi dengan WHERE
-- =====================================================
DELETE FROM laporan 
WHERE id_laporan = 3;
