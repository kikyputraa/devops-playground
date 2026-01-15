FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libc6-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Upgrade pip & kawan-kawan
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# JURUS PAMUNGKAS: Hapus folder metadata jaraco lama jika ada, lalu install versi aman
RUN pip uninstall -y jaraco.context && \
    pip install --no-cache-dir "jaraco.context>=6.1.0"

COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Pastikan lagi setelah install requirements, versi aman yang menang
RUN pip install --no-cache-dir --upgrade "jaraco.context>=6.1.0"

COPY app/ .
EXPOSE 5000
CMD ["python", "app.py"]