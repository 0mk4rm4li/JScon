#!/bin/bash

#Author : - Omkar Mali
#Date : - 11 November, 2020

if [ $EUID != 0 ]
then
  echo "Please run this script as root ! Better run with sudo."
  exit 1
fi

wget https://github.com/lc/gau/releases/download/v1.0.7/gau_1.0.7_linux_amd64.tar.gz
gzip -d gau_1.0.7_linux_amd64.tar.gz && tar -xvf gau_1.0.7_linux_amd64.tar
mv gau /usr/bin/gau
rm gau_1.0.7_linux_amd64.tar LICENSE  README.md

wget https://github.com/lc/subjs/releases/download/v1.0.1/subjs_1.0.1_linux_amd64.tar.gz
gzip -d subjs_1.0.1_linux_amd64.tar.gz && tar -xvf subjs_1.0.1_linux_amd64.tar
mv subjs /usr/local/bin/subjs
rm subjs_1.0.1_linux_amd64.tar LICENSE  README.md
