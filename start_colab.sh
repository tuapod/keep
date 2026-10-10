#!/bin/bash
# start_colab.sh

# یک حلقه بی‌نهایت برای اجرای خودکار colabapi
while true; do
    echo "$(date): Starting new Colab session..."
    
    # اجرای colabapi در یک سشن tmux جداگانه
    # این کار باعث میشه حتی اگه اسکریپت اصلی متوقف بشه، سشن کولب زنده بمونه
    tmux new-session -d -s colab_session "colabapi run --gpu T4"
    
    # منتظر موندن برای ۱۲ ساعت (43200 ثانیه)
    echo "$(date): Waiting for 12 hours before next session..."
    sleep 43200
    
    # اختیاری: قبل از شروع سشن جدید، سشن قبلی رو متوقف کن
    # colabapi stop
done
