FROM python:3.7-alpine3.10
WORKDIR /app

# Perhatikan jalur 'app/' dibawah ini
COPY app/requirements.txt .
RUN pip install -r requirements.txt

COPY app/ .

CMD ["python", "app.py"]