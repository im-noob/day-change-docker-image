# to Run
  
    docker run --pull always \
        -e TELEGRAM_BOT_TOKEN=$TELEGRAM_BOT_TOKEN \
        -v data-volumne:/trading-day-change/data \
        -it aaravonly4you/day-change-docker-image:latest


    TELEGRAM_BOT_TOKEN=""

    * * * * * /usr/bin/docker run --pull always -e TELEGRAM_BOT_TOKEN=$TELEGRAM_BOT_TOKEN -v data-volumne:/trading-day-change/data  aaravonly4you/day-change-docker-image:latest >> /home/aarav/Downloads/day_change.log 2>&1

