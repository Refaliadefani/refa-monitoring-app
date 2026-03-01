# 1. Pake Slim biar lebih stabil koneksinya
FROM python:3.11-slim

# 2. Pake apt-get (karena ini base Debian/Slim), bukan apk!
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# 3. Set folder kerja
WORKDIR /app

# 4. Copy requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy semua file project
COPY . .

# 6. Expose port
EXPOSE 8000

# 7. Jalanin server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]