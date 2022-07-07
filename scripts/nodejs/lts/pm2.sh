cd ~
curl -sL https://deb.nodesource.com/setup_lts.x | sudo bash -
sudo apt install nodejs -y
sudo npm i pm2 -g

node_version=$(node -v)
npm_version=$(npm -v)
pm2_version=$(pm2 -v)

printf "Thanks for using this script! You can leave a star on https://github.com/Sayrix/AutoInstall"
printf "Node version: $node_version"
printf "NPM version: $npm_version"
printf "PM2 version: $pm2_version"