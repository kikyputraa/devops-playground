FROM python:3.11-alpine

# Mencegah Python menulis file .pyc dan memastikan output log langsung muncul
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Upgrade core tools di awal untuk fix kerentanan bawaan base image
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# Copy requirements terlebih dahulu (agar Docker bisa memanfaatkan cache)
COPY app/requirements.txt .

# Install dependencies aplikasi termasuk fix untuk jaraco.context
RUN pip install --no-cache-dir "jaraco.context>=6.1.0" && \
    pip install --no-cache-dir -r requirements.txt

# Copy seluruh source code aplikasi
COPY app/ .

# Membuat user non-root demi keamanan (opsional tapi sangat disarankan)
RUN useradd -m myuser
USER myuser

EXPOSE 5000

# Healthcheck untuk memastikan container benar-benar siap
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:5000/ || exit 1

CMD ["python", "app.py"]