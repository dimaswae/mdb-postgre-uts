-- Script untuk membuat skema dan tabel mahasiswas dengan berbagai constraint
CREATE SCHEMA SALAM;

GO

CREATE TABLE SALAM.mahasiswas (
    nim CHAR(10) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    prodi VARCHAR(100) NOT NULL,
    fakultas VARCHAR(100) NOT NULL,
    semester INT CHECK (semester BETWEEN 1 AND 14),
    angkatan INT CHECK (angkatan BETWEEN 2000 AND EXTRACT(YEAR FROM CURRENT_DATE)),
    email VARCHAR(100) UNIQUE,
    usia INT CHECK (usia >= 16),
    jenis_kelamin CHAR(1) CHECK (jenis_kelamin IN ('L', 'P')),
    ipk NUMERIC(3,2) CHECK (ipk BETWEEN 0.00 AND 4.00) DEFAULT NULL,
    status_aktif VARCHAR(20) CHECK (status_aktif IN ('Aktif', 'Cuti', 'Lulus', 'Drop Out')),
    
    -- Jika IPK masih NULL (mahasiswa baru), maka semester HARUS 1
    CONSTRAINT check_semester_mahasiswa_baru CHECK (
        (ipk IS NULL AND semester = 1) OR (ipk IS NOT NULL)
    )
);

INSERT INTO SALAM.mahasiswas 
(nim, nama, prodi, fakultas, semester, angkatan, email, usia, jenis_kelamin, ipk, status_aktif)
VALUES 
('1237050001', 'Ahmad Fauzi', 'Informatika', 'Sains dan Teknologi', 5, 2023, 'ahmad@mail.com', 20, 'L', 3.45, 'Aktif');

-- Uji Primary Key
-- mencoba insert nim yang sudah ada
INSERT INTO SALAM.mahasiswas 
(nim, nama, prodi, fakultas, semester, angkatan, email, usia, jenis_kelamin, ipk, status_aktif)
VALUES 
('1237050001', 'Tes Duplikat', 'Informatika', 'Sains & Teknologi', 5, 2023, 'tes@mail.com', 20, 'L', 3.0, 'Aktif');

-- Uji Unique key
-- mencoba pakai email yang sudah ada
INSERT INTO SALAM.mahasiswas 
(nim, nama, prodi, fakultas, semester, angkatan, email, usia, jenis_kelamin, ipk, status_aktif)
VALUES 
('1257050999', 'Email Duplikat', 'Informatika', 'Sains & Teknologi', 1, 2025, 'ahmad@mail.com', 18, 'L', NULL, 'Aktif');

-- Uji CHECK Usia
-- usia terlalu muda (usia < 16 tahun)
INSERT INTO SALAM.mahasiswas 
(nim, nama, prodi, fakultas, semester, angkatan, email, usia, jenis_kelamin, ipk, status_aktif)
VALUES 
('1257050998', 'Usia Tidak Valid', 'Informatika', 'Sains & Teknologi', 1, 2025, 'invalid_usia@student.uinsgd.ac.id', 15, 'L', NULL, 'Aktif');

-- Uji CHECK ipk
-- ipk di luar batas
INSERT INTO SALAM.mahasiswas 
(nim, nama, prodi, fakultas, semester, angkatan, email, usia, jenis_kelamin, ipk, status_aktif)
VALUES 
('1257050997', 'IPK Tidak Valid', 'Informatika', 'Sains & Teknologi', 1, 2025, 'invalid_ipk@student.uinsgd.ac.id', 18, 'L', 4.5, 'Aktif');

-- Uji CHECK semester
-- semester di luar batas
INSERT INTO SALAM.mahasiswas 
(nim, nama, prodi, fakultas, semester, angkatan, email, usia, jenis_kelamin, ipk, status_aktif)
VALUES 
('1257050996', 'Semester Tidak Valid', 'Informatika', 'Sains & Teknologi', 20, 2025, 'invalid_semester@student.uinsgd.ac.id', 18, 'L', NULL, 'Aktif');

-- Uji CHECK jenis kelamin (L/P)
-- jenis kelamin tidak valid
INSERT INTO SALAM.mahasiswas 
(nim, nama, prodi, fakultas, semester, angkatan, email, usia, jenis_kelamin, ipk, status_aktif)
VALUES 
('1257050995', 'Gender Tidak Valid', 'Informatika', 'Sains & Teknologi', 1, 2025, 'invalid_gender@student.uinsgd.ac.id', 18, 'X', NULL, 'Aktif');

-- Uji CHECK status aktif
-- status aktif tidak sesuai
INSERT INTO SALAM.mahasiswas 
(nim, nama, prodi, fakultas, semester, angkatan, email, usia, jenis_kelamin, ipk, status_aktif)
VALUES 
('1257050994', 'Status Tidak Valid', 'Informatika', 'Sains & Teknologi', 1, 2025, 'invalid_status@student.uinsgd.ac.id', 18, 'L', NULL, 'Keluar');

-- Uji CHECK NULL
-- nama kosong
INSERT INTO SALAM.mahasiswas 
(nim, nama, prodi, fakultas, semester, angkatan, email, usia, jenis_kelamin, ipk, status_aktif)
VALUES 
('1257050993', NULL, 'Informatika', 'Sains & Teknologi', 1, 2025, 'invalid_null@student.uinsgd.ac.id', 18, 'L', NULL, 'Aktif');

