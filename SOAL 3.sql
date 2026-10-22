SELECT 
    g.nama_gedung,
    COUNT(l.id_laporan) AS total_lapor_kerusakan
FROM laporan l
JOIN gedung g ON l.id_gedung = g.id_gedung
WHERE l.tingkat_urgensi IN ('Sedang', 'Tinggi')
GROUP BY g.nama_gedung;
