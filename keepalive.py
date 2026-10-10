# keepalive.py
from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def health_check():
    return "OK", 200

if __name__ == '__main__':
    # Railway به طور خودکار متغیر PORT رو تنظیم می‌کنه
    port = int(os.environ.get('PORT', 8080))
    app.run(host='0.0.0.0', port=port)
