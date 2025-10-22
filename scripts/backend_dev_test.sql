-- Uji Testing user backend_dev
SET ROLE backend_dev;

-- Uji SELECT
SELECT * FROM SALAM.mahasiswas;

-- Uji INSERT
INSERT INTO SALAM.mahasiswas(nim,nama,prodi,fakultas,semester,angkatan,email,usia,jenis_kelamin,ipk,status_aktif)
VALUES('1237050200','Test Backend.dev','Informatika','Sains dan Teknologi',3,2025,'testbackend@mail.com',20,'L',3.5,'Aktif');

-- Uji UPDATE
UPDATE SALAM.mahasiswas SET ipk=3.6 WHERE nim='1237050200';

-- Uji DELETE
 DELETE FROM SALAM.mahasiswas WHERE nim='1237050200';

-- Uji buat Table (Harus gagal)
CREATE TABLE SALAM.test_backend(id INT);

-- Kembali ke superuser
RESET ROLE;