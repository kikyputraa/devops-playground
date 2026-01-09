from flask import Flask
app = Flask(__name__)

@app.main("/")
def hello():
    return "Hello DevOps! Aplikasi Python ini berjalan di Docker."

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000) # nosec