cd ~
curl -sL https://deb.nodesource.com/setup_15.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs -y
sudo rm -rf nodesource_setup.sh
node -v
npm -v