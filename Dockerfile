# 1. BASE IMAGE: Menggunakan base image resmi Python
# Kita pakai versi 3.10-slim-buster untuk ukuran yang lebih kecil
FROM python:3.10-slim-buster

# 2. ENVIRONMENT: Menetapkan variabel lingkungan
# Membuat Python mencetak output ke terminal tanpa buffer
ENV PYTHONUNBUFFERED 1

# 3. WORKDIR: Mengatur direktori kerja dalam container
# Semua perintah berikutnya akan dijalankan dari direktori ini
WORKDIR /usr/src/app

# 4. DEPENDENCIES: Menyalin file dependency dan menginstalnya
# Menyalin requirements.txt (atau poetry.lock, dsb.) ke direktori kerja
COPY requirements.txt .

# Menginstal dependency. Flag --no-cache-dir menghemat ruang disk.
RUN pip install --no-cache-dir -r requirements.txt

# 5. CODE: Menyalin sisa kode aplikasi
# Menyalin semua file dan folder di direktori lokal ke direktori kerja container
COPY . .

# 6. EXPOSE: Memberi tahu Docker bahwa container akan mendengarkan di port ini
# Port standar untuk aplikasi web (seperti Flask/Django)
EXPOSE 8000

# 7. COMMAND: Perintah yang dijalankan saat container dimulai
# Ganti 'app.py' dengan nama file aplikasi Anda dan 'gunicorn' jika menggunakan server produksi
CMD ["python", "app.py"] 
# Alternatif untuk server web: CMD ["gunicorn", "--bind", "0.0.0.0:8000", "wsgi:app"]
