cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs -y
sudo rm -rf nodesource_setup.sh
sudo npm i pm2 -g
node -v
npm -v
pm2 -v