-- Dummy Tabel Transaksi: Laporan (3 baris)
INSERT INTO laporan (deskripsi_kerusakan, tingkat_urgensi, id_pengguna, id_gedung) VALUES 
('Plafon bocor parah di lantai 2', 'Tinggi', 1, 1),
('Lampu ruangan kelas redup dan berkedip', 'Sedang', 2, 2),
('Gagang pintu utama lepas', 'Rendah', 3, 3);


-- Dummy Tabel Induk: Gedung (3 baris)
INSERT INTO gedung (nama_gedung, lokasi) VALUES 
('Gedung Kuliah Bersama A', 'Kampus Barat'),
('Gedung Laboratorium Terpadu', 'Kampus Timur'),
('Gedung Rektorat Lama', 'Kampus Utara');


-- Dummy Tabel Induk: Pengguna (3 baris)
INSERT INTO pengguna (nama_pengguna, nomor_pengenal, peran) VALUES
('Rian Hidayat', '264311005', 'Mahasiswa'),
('Prof. Ahmad Subarjo', '197502032001121002', 'Dosen'),
('Dewi Lestari', '198808122015042001', 'Tendik');


-- =====================================================
-- [READ] Tampilkan seluruh isi salah satu Tabel Induk
-- =====================================================
SELECT * FROM gedung;

-- =====================================================
-- [UPDATE] Ubah satu nilai data pada Tabel Transaksi dengan WHERE PK
-- =====================================================
UPDATE laporan 
SET tingkat_urgensi = 'Tinggi' 
WHERE id_laporan = 2;

-- =====================================================
-- [DELETE] Hapus salah satu baris data dummy pada Tabel Transaksi dengan WHERE
-- =====================================================
DELETE FROM laporan 
WHERE id_laporan = 3;
