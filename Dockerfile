# Menggunakan versi Python slim yang efisien untuk riset Anda
FROM python:3.11-slim

# 1. Install wget dan bersihkan cache agar image tetap kecil
# Menggunakan && untuk menggabungkan perintah dalam satu layer
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 2. Tentukan folder kerja
WORKDIR /app

# 3. Copy file utama
# Pastikan file ini ada di root repository GitHub kamu
COPY main.py /app/main.py

# 4. Verifikasi (Opsional - untuk debugging log)
RUN ls -la /app && wget --version

# 5. Jalankan script
CMD ["python", "/app/main.py"]
