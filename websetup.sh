#!/bin/sh
#
#
sudo apt update
sudo apt install unzip apache2 -y

mkdir -p Barista 
cd Barista
sudo m -r /var/www/html/*

wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip
unzip 2137_barista_cafe.zip
cd 2137_barista_cafe
sudo cp -r * /var/www/html
