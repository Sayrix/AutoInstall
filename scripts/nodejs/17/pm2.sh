cd ~
curl -sL https://deb.nodesource.com/setup_17.x | sudo bash -
sudo apt install nodejs -y
sudo npm i pm2 -g

clear

node_version=$(node -v)
npm_version=$(npm -v)
pm2_version=$(pm2 -v)

printf "\nThanks for using this script! You can leave a star on https://github.com/Sayrix/AutoInstall
Node version: $node_version
NPM version: $npm_version
PM2 version: $pm2_version
"