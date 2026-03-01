# 1. Pake base image Python yang paling kecil (Alpine) biar server mentor lo gak penuh
FROM python:3.11-slim

# 2. Instal library sistem yang dibutuhin buat psutil (Alpine butuh ini)
RUN apk add --no-cache gcc musl-dev linux-headers

# 3. Set folder kerja
WORKDIR /app

# 4. Copy requirements.txt dulu biar build-nya cepet (pake cache)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy semua file project lo
COPY . .

# 6. Expose port Django
EXPOSE 8000

# 7. Jalanin servernya
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]