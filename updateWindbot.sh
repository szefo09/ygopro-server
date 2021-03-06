#!/bin/bash
echo "updating Windbot"
cd /home/pi/server/ygopro-server
rm -rf windbot
git clone https://github.com/szefo09/Windbot --recursive
mv Windbot windbot
cd windbot
xbuild /property:Configuration=Release /property:TargetFrameworkVersion="v4.5"
ln -s bin/Release/WindBot.exe .
ln -s ../ygopro/cards.cdb .
cd ..
chmod -R 777 /home/pi/server/*
sudo pm2 restart 1
