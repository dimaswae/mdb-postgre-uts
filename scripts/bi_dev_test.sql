-- Uji akses untuk role bi_dev
SET ROLE bi_dev;

-- Uji SELECT
SELECT * FROM SALAM.mahasiswas;

-- Uji INSERT (Harus gagal)
INSERT INTO SALAM.mahasiswas(nim,nama,prodi,fakultas,semester,angkatan,email,usia,jenis_kelamin,ipk,status_aktif)
VALUES('1237050201','Test BI','Informatika','Sains dan Teknologi',3,2025,'testbi@mail.com',20,'P',3.7,'Aktif');

-- kembali ke superuser
RESET ROLE;