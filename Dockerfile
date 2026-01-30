FROM python:3.11-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN pip install --no-cache-dir --upgrade pip setuptools wheel

COPY app/requirements.txt .

RUN pip install --no-cache-dir "jaraco.context>=6.1.0" && \
    pip install --no-cache-dir -r requirements.txt

COPY app/ .

RUN adduser -D myuser
USER myuser

EXPOSE 5000

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:5000/ || exit 1

CMD ["python", "app.py"]