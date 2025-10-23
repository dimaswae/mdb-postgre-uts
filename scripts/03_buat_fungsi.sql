-- 01. Fungsi sederhana untuk cek status mahasiswa
CREATE OR REPLACE FUNCTION SALAM.cek_status_aktif(p_nim CHAR(10))
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    status_mhs VARCHAR(20);
BEGIN
    SELECT status_aktif INTO status_mhs
    FROM SALAM.mahasiswas 
    WHERE nim = p_nim;
    
    IF status_mhs IS NULL THEN
        RETURN 'MAHASISWA TIDAK DITEMUKAN';
    ELSE
        RETURN status_mhs;
    END IF;
END;
$$;

-- 02. Fungsi hitung mahasiswa per prodi
CREATE OR REPLACE FUNCTION SALAM.hitung_mahasiswa_per_prodi(p_prodi VARCHAR)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
    total INTEGER;
BEGIN
    SELECT COUNT(*) INTO total
    FROM SALAM.mahasiswas 
    WHERE prodi = p_prodi 
    AND status_aktif = 'Aktif';
    
    RETURN total;
END;
$$;

-- 03. Fungsi kategorisasi IPK
CREATE OR REPLACE FUNCTION SALAM.kategori_ipk(p_ipk NUMERIC)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
BEGIN
    IF p_ipk IS NULL THEN
        RETURN 'BELUM ADA IPK';
    ELSIF p_ipk >= 3.5 THEN
        RETURN 'SANGAT MEMUASKAN';
    ELSIF p_ipk >= 3.0 THEN
        RETURN 'MEMUASKAN';
    ELSIF p_ipk >= 2.5 THEN
        RETURN 'CUKUP';
    ELSIF p_ipk >= 2.0 THEN
        RETURN 'KURANG';
    ELSE
        RETURN 'SANGAT KURANG';
    END IF;
END;
$$;

-- 04. Fungsi pencarian sederhana
CREATE OR REPLACE FUNCTION SALAM.cari_mahasiswa_sederhana(p_keyword VARCHAR)
RETURNS TABLE(
    nim CHAR(10),
    nama VARCHAR(100),
    prodi VARCHAR(100),
    semester INTEGER,
    ipk NUMERIC,
    status_aktif VARCHAR(20)
) 
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        m.nim, m.nama, m.prodi, m.semester, m.ipk, m.status_aktif
    FROM SALAM.mahasiswas m
    WHERE m.nim LIKE '%' || p_keyword || '%'
       OR m.nama ILIKE '%' || p_keyword || '%'
    ORDER BY m.nama;
END;
$$;