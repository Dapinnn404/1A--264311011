-- Query Kompleks dan Agregasi Laporan
SELECT 
    p.nama_pengguna,
    COUNT(l.id_laporan) AS total_laporan_kerusakan
FROM laporan l
JOIN pengguna p ON l.id_pengguna = p.id_pengguna
WHERE l.tingkat_urgensi IN ('Sedang', 'Tinggi')
GROUP BY p.nama_pengguna;
