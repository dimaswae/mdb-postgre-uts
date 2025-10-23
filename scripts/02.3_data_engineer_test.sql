-- Uji akses untuk role data_engineer
SET ROLE data_engineer;

-- Uji CREATE TABLE
CREATE TABLE SALAM.test_dataeng(id SERIAL PRIMARY KEY, info TEXT);

-- Uji INSERT
INSERT INTO SALAM.test_dataeng(info) VALUES('Percobaan Data Engineer');
SELECT * FROM SALAM.test_dataeng;

-- Uji UPDATE
UPDATE SALAM.test_dataeng SET info='Update Berhasil' WHERE id=1;
SELECT * FROM SALAM.test_dataeng;

-- Uji DELETE
DELETE FROM SALAM.test_dataeng WHERE id=1;

-- Uji DROP TABLE
DROP TABLE SALAM.test_dataeng;

-- kembali ke superuser
SET ROLE postgres;