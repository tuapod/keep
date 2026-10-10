# Dockerfile
FROM python:3.11-slim

# نصب پیش‌نیازهای سیستمی
RUN apt-get update && apt-get install -y \
    tmux \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# نصب colabapi و Flask
RUN pip install --no-cache-dir colabapi flask

# کپی کردن اسکریپت‌ها
WORKDIR /app
COPY keepalive.py .
COPY start_colab.sh .

# دادن دسترسی اجرا به اسکریپت
RUN chmod +x start_colab.sh

# پورت پیش‌فرض Railway
EXPOSE 8080

# اجرای همزمان وب‌سرور و اسکریپت راه‌اندازی کولب
CMD ["sh", "-c", "python keepalive.py & ./start_colab.sh"]
