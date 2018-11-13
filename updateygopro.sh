#!/bin/bash
echo "updating Ygopro"
sudo pm2 stop all
cd /home/pi/server/ygopro-server
rm -rf ygopro
git clone https://github.com/purerosefallen/ygopro --branch=server --recursive
cd ygopro/
git submodule foreach git checkout master
premake4 gmake
cd build/
make config=release
cd ..
ln -s bin/release/ygopro ./
strip ygopro
mkdir replay
mkdir expansions
cd ..
chmod -R 777 /home/pi/server/*
cd /home/pi/server/ygopro-server
./update.sh
sudo pm2 restart all

