# to Run
  
    docker run --pull always \
        -e TELEGRAM_BOT_TOKEN=$TELEGRAM_BOT_TOKEN \
        -v data-volumne:/trading-day-change/data \
        -it aaravonly4you/day-change-docker-image:latest