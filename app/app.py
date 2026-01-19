import os
from flask import Flask, jsonify

app = Flask(__name__)

# Mengambil info versi dari Environment Variable
APP_VERSION = os.getenv("APP_VERSION", "V1-Stable")

@app.route('/')
def hello():
    return jsonify({
        "status": "success",
        "message": "DevOps Playground API",
        "version": APP_VERSION,
        "environment": "Production"
    })

# TAMBAHKAN INI AGAR UNIT TEST PASS
@app.route('/health')
def health():
    return jsonify({"status": "healthy"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000) #nosec