cd ~
curl -sL https://deb.nodesource.com/setup_17.x | sudo bash -
sudo apt install nodejs -y

node_version=$(node -v)
npm_version=$(npm -v)

printf "Thanks for using this script! You can leave a star on https://github.com/Sayrix/AutoInstall"
printf "Node version: $node_version"
printf "NPM version: $npm_version"