import os
from flask import Flask, jsonify

app = Flask(__name__)

APP_VERSION = os.getenv("APP_VERSION", "V1-Stable")

@app.route('/')
def hello():
    return jsonify({
        "status": "success",
        "message": "DevOps Playground API",
        "version": APP_VERSION,
        "environment": "Production"
    })

@app.route('/health')
def health():
    return jsonify({"status": "ok"}), 200

if __name__ == '__main__':
    host = os.getenv("APP_HOST", "127.0.0.1")
    app.run(host=host, port=5000) #nosec