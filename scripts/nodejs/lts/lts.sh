cd ~
curl -sL https://deb.nodesource.com/setup_lts.x | sudo bash -
sudo apt install nodejs -y

clear

node_version=$(node -v)
npm_version=$(npm -v)

printf "\nThanks for using this script! You can leave a star on https://github.com/Sayrix/AutoInstall
Node version: $node_version
NPM version: $npm_version
"