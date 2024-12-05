# to Run
  
    docker run --pull always \
        -e TELEGRAM_BOT_TOKEN=$TELEGRAM_BOT_TOKEN \
        -v data-volumne:/trading-day-change/data \
        -it aaravonly4you/day-change-docker-image:latest


    */10 * * * * /usr/bin/docker run --pull always -e TELEGRAM_BOT_TOKEN=$TELEGRAM_BOT_TOKEN -v data-volumne:/trading-day-change/data -it aaravonly4you/day-change-docker-image:latest >> ~/logs/day_change.log 2>&1
