# 🐘 PostgreSQL & pgAdmin Docker Setup — UTS Pengembangan Aplikasi Web

Proyek ini merupakan tugas **UTS** mata kuliah **Pengembangan Aplikasi Web**.  
Tujuannya adalah untuk menjalankan **PostgreSQL** dan **pgAdmin4** menggunakan **teknik kontainerisasi (Docker)**, dengan pengaturan environment yang disembunyikan dalam file `.env`.

---

## 🚀 Services

### 1. PostgreSQL
- **Container Name:** `postgres_dimasrizqiahidayat`
- **Image:** `postgres:15`
- **Port:** `22073:5432`
- **Database:** `mahasiswa_db`
- **User:** `postgres`
- **Password:** (disembunyikan di `.env`)
- **Network:** `exam-network`

### 2. pgAdmin4
- **Container Name:** `pgadmin_dimasrizqiahidayat`
- **Image:** `dpage/pgadmin4`
- **Port:** `44073:80`
- **Email:** `admin@admin.com`
- **Password:** (disembunyikan di `.env`)
- **Depends on:** PostgreSQL service

---

## ⚙️ Cara Menjalankan

1. Pastikan Docker sudah terinstal di komputer kamu.
2. Clone repository ini:
   ```bash
   git clone https://github.com/dimaswae/mhs-data-manager.git

   cd mhs-data-manager
   ```
3. Jalankan container
    ```bash
    docker-compose up -d
    ```
4. Akses pgAdmin di browser:
    ```bash
    http://localhost:44073
    ```
5. Hubungkan server PostgreSQL di pgAdmin dengan container internal (lokal)

## 🧩 Database
**Skema**: SALAM

Tabel: mahasiswas

```sql
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
```

Contrainst yang di uji :
- ✅ PRIMARY KEY
- ✅ UNIQUE KEY
- ✅ CHECK (Usia, ipk, semester, status aktif, NULL value)

## 🔐 User Roles
| User            | Role / Privilege                          |
| --------------- | ----------------------------------------- |
| `backend_dev`   | CRUD semua table                          |
| `bi_dev`        | SELECT (read only)                        |
| `data_engineer` | CREATE, MODIFY, DROP objects + CRUD table |

## 📄 Laporan UTS

Kamu bisa mengunduh laporan lengkap dalam format PDF di sini:  
📥 [Download Laporan UTS (PDF)](./Laporan_UTS_DimasRizqiaHidayat.pdf)

---

## 🧑‍💻 Author

**Dimas Rizqia Hidayat**  
Informatika — UIN Sunan Gunung Djati Bandung  
📚 Semester 5 — 2025 
📚 NIM : 1237050073 
🐙 GitHub: [@dimaswae](https://github.com/dimaswae)
