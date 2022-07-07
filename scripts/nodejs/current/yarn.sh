cd ~
sudo apt remove cmdtest -y
curl -sL https://deb.nodesource.com/setup_current.x | sudo bash -
sudo apt -y install nodejs -y
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt install yarn -y
yarn global add pm2

node_version=$(node -v)
yarn_version=$(yarn -v)

printf "Thanks for using this script! You can leave a star on https://github.com/Sayrix/AutoInstall"
printf "Node version: $node_version"
printf "Yarn version: $yarn_version"