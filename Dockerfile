FROM python:3.9-slim
WORKDIR /app
# Docker akan mencari file di folder yang sama dengan Dockerfile
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "app.py"]