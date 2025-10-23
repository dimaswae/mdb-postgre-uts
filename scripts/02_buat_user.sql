-- Script new user etc --
-- Pastikan kamu login sebagai superuser (misal: postgres)
CREATE USER backend_dev WITH PASSWORD 'backend123';
CREATE USER bi_dev WITH PASSWORD 'bidev123';
CREATE USER data_engineer WITH PASSWORD 'dataeng123';

-- ============================================================================== --
-- Berikan akses umum ke skema
GRANT USAGE ON SCHEMA SALAM TO backend_dev, bi_dev, data_engineer;

-- backend_dev access account
-- CRUD Access : dapat membaca dan memodifikasi data di semua tabel
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA SALAM TO backend_dev;

-- Agar hak akses ini otomatis berlaku untuk tabel baru
ALTER DEFAULT PRIVILEGES IN SCHEMA SALAM
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO backend_dev;

-- bi_dev access account
-- Hanya dapat membaca (SELECT)
GRANT SELECT ON ALL TABLES IN SCHEMA SALAM TO bi_dev;

-- Termasuk view
GRANT SELECT ON ALL SEQUENCES IN SCHEMA SALAM TO bi_dev;

ALTER DEFAULT PRIVILEGES IN SCHEMA SALAM
GRANT SELECT ON TABLES TO bi_dev;

-- data_engineer account (Full Access)
-- Dapat membuat, mengubah, dan menghapus objek dalam skema
GRANT CREATE, USAGE ON SCHEMA SALAM TO data_engineer;

-- CRUD ke seluruh tabel
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA SALAM TO data_engineer;

-- Hak tambahan
ALTER DEFAULT PRIVILEGES IN SCHEMA SALAM
GRANT ALL PRIVILEGES ON TABLES TO data_engineer;
