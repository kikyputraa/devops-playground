FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy aplikasi
COPY app/ .

EXPOSE 5000

CMD ["python", "app.py"]