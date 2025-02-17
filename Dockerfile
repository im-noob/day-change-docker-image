FROM python:latest

# Install tzdata
RUN apt-get update && apt-get install -y tzdata

# Set timezone to IST
ENV TZ=Asia/Kolkata

# Configure tzdata (non-interactive)
RUN ln -snf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && echo "Asia/Kolkata" > /etc/timezone


COPY requirements.txt .
RUN pip install -r requirements.txt

# Install dependencies
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libxshmfence1 \
    libxss1 \
    libxtst6 \
    xdg-utils \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set Chromium path
ENV CHROME_PATH="/usr/bin/chromium"

COPY ./trading-day-change/ trading-day-change/
COPY ./trading-telegram-bot/ trading-telegram-bot/

WORKDIR /trading-day-change
CMD ["python", "day_change_check.py"]

# USER root
# RUN apt update && \
#     apt install -y openjdk-17-jdk && \
#     apt install -y ant && \
#     apt clean;

# ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64/
# RUN export JAVA_HOME

# RUN apt-get install libgbm1 libxkbcommon0 -y
# USER airflow
RUN playwright install chromium