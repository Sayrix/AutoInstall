cd ~
curl -sL https://deb.nodesource.com/setup_lts.x | sudo bash -
sudo apt -y install nodejs -y
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt install yarn -y