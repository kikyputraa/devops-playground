FROM python:3.9-slim
WORKDIR /app

# Perhatikan jalur 'app/' dibawah ini
COPY app/requirements.txt .
RUN pip install -r requirements.txt

COPY app/ .

CMD ["python", "app.py"] 