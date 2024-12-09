cp -r ../trading-day-change/ ./trading-day-change/
cp -r ../trading-telegram-bot/ ./trading-telegram-bot/
rm -rf ./trading-telegram-bot/.git
rm -rf ./trading-day-change/.git

docker build -t aaravonly4you/day-change-docker-image:latest . 
docker push aaravonly4you/day-change-docker-image:latest

rm -rf ./trading-telegram-bot/
rm -rf ./trading-day-change/
