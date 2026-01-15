FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Menggunakan apt-get karena python:3.9-slim berbasis Debian
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libc6-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Upgrade tools utama dan paksa install versi jaraco.context yang aman dari CVE
RUN pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir "jaraco.context>=6.1.0"

# Install requirements dengan flag upgrade agar tidak menimpa versi aman di atas
COPY app/requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Pastikan lagi jaraco tetap di versi terbaru setelah install requirements
RUN pip install --no-cache-dir "jaraco.context>=6.1.0"

COPY app/ .

EXPOSE 5000

CMD ["python", "app.py"]