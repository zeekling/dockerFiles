#!/usr/bin/env bash 

rm -rf node-v16.16.0-linux-x64*

wget "https://repo.huaweicloud.com/nodejs/v16.16.0/node-v16.16.0-linux-x64.tar.xz"

tar xvf node-v16.16.0-linux-x64.tar.xz

rm -rf node-v16.16.0-linux-x64.tar.xz

sudo docker build -t "yarn:1.0" .

