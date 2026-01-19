import os
from flask import Flask, jsonify

app = Flask(__name__)

# Mengambil info versi dari Environment Variable (Default: V1-Stable)
APP_VERSION = os.getenv("APP_VERSION", "V1-Stable")

@app.route('/')
def hello():
    return jsonify({
        "status": "success",
        "message": "DevOps Playground API",
        "version": APP_VERSION,
        "environment": "Production"
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)  # nosec