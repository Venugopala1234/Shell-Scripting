#!/bin/sh
#
#
svc="unzip apache2"
service="/var/www/html"
url="https://www.tooplate.com/zip-templates/2137_barista_cafe.zip"
art_name="2137_barista_cafe"
sudo apt update
sudo apt install $svc -y

mkdir -p Barista 
cd Barista
sudo m -r $service/*

wget $url
unzip $art_name.zip
cd $art_name
sudo cp -r * $service
