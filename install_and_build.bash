# Updating repos
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget apt-transport-https git ca-certificates curl

# Add Docker's official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# installing Docker
sudo apt install -y  docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# BUilding docker
COPY ../trading-day-change/ ./trading-day-change/
COPY ../trading-telegram-bot/ ./trading-telegram-bot/
rm -rf ./trading-telegram-bot/.git
rm -rf ./trading-day-change/.git

docker build -t aaravonly4you/day-change-docker-image:latest . 
docker push aaravonly4you/day-change-docker-image:latest