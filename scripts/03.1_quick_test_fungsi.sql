-- =============================================================================
-- QUICK TEST - FUNGSI SEDERHANA
-- =============================================================================

SET search_path TO SALAM;

-- Quick Test 1: Fungsi Dasar
SELECT 'QUICK TEST RESULTS:' as test_header;

-- 01. Test cek_status_aktif
-- test dengan data ada
SELECT 
    nim as test_nim,
    SALAM.cek_status_aktif(nim) as status_dicek,
    '✓' as hasil
FROM SALAM.mahasiswas 
WHERE nim = '1247050005'

UNION ALL

-- Test dengan data tidak ada
SELECT 
    '0000000000' as test_nim,
    SALAM.cek_status_aktif('0000000000') as status_dicek,
    '✓' as hasil;

UNION ALL

-- 02. Test hitung_mahasiswa_per_prodi
SELECT 
    '2. hitung_mahasiswa_prodi',
    SALAM.hitung_mahasiswa_per_prodi('Informatika')::VARCHAR,
    CASE WHEN SALAM.hitung_mahasiswa_per_prodi('Informatika') >= 0 THEN 'PASS' ELSE 'FAIL' END

UNION ALL

-- 03. Test kategori_ipk
SELECT 
    ipk_test as nilai_ipk,
    SALAM.kategori_ipk(ipk_test) as kategori,
    '✓' as hasil
FROM (VALUES 
    (NULL), (1.75), (2.25), (2.75), (3.25), (3.75)
) AS test_ipk(ipk_test);

-- Ambil 3 mahasiswa dengan IPK tertinggi beserta kategorinya
SELECT 
    nim,
    nama,
    ipk,
    SALAM.kategori_ipk(ipk) as kategori_ipk,
    '✓' as hasil
FROM SALAM.mahasiswas 
WHERE ipk IS NOT NULL
ORDER BY ipk DESC
LIMIT 3;

UNION ALL

-- 04. Test cari_mahasiswa_sederhana
-- Test pencarian dengan NIM 
SELECT * FROM SALAM.cari_mahasiswa_sederhana('123');

-- Test pencarian dengan nama
SELECT * FROM SALAM.cari_mahasiswa_sederhana('Ahmad');

-- Quick Test 2: Sample Data dengan Fungsi
-- Ambil 5 mahasiswa aktif dengan IPK tertinggi beserta kategorinya
SELECT 
    nim,
    nama,
    prodi,
    semester,
    ipk,
    SALAM.kategori_ipk(ipk) as kategori_ipk,
    status_aktif
FROM SALAM.mahasiswas 
WHERE SALAM.cek_status_aktif(nim) = 'Aktif'
ORDER BY ipk DESC NULLS LAST
LIMIT 5;