#!/bin/bash
echo "updating"
mkdir update
cd update
git clone https://github.com/Fluorohydride/ygopro-scripts.git --recursive
git clone https://github.com/Fluorohydride/ygopro-pre-script.git --recursive
git clone https://github.com/Ygoproco/Live2017Links.git --recursive
git clone https://github.com/szefo09/cdb.git
echo "copying"
mkdir target
rm -rf Live2017Links/script
cp -u Live2017Links/*.cdb target
cp -u cdb/*.cdb target
cp -u Live2017Links/lflist.conf target
cp -u ygopro-scripts/*.lua target
cp -u ygopro-pre-script/**/**/*.lua target
cp -u ygopro-pre-script/**/**/**/*.lua target
cp -u target/cards.cdb /home/pi/server/ygopro-server/ygopro
rm -rf target/cards.cdb
cp -u target/*.lua /home/pi/server/ygopro-server/ygopro/script
cp -u target/*.cdb /home/pi/server/ygopro-server/ygopro/expansions
#cp -u target/lflist.conf /home/pi/server/ygopro-server/ygopro
#rm -rf Live2017Links
#rm -rf ygopro-pre-script
#rm -rf ygopro-scripts
#rm -rf target
cd /home/pi/server/ygopro-server/ygopro/script
#git add *
#git commit -m "autoUpdate"
#git push
cd /home/pi/server/ygopro-server
rm -rf update
chmod -R 777 /home/pi/server/*
echo "done"
