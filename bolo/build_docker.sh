#!/bin/bash

mkdir -p /tmp/bolo-solo

cp -rf ./Dockerfile ./gulpfile.js ./manifest.json ./package.json ./pom.xml src /tmp/bolo-solo

cp -rf ./settings.xml /tmp/bolo-solo

cd /tmp/bolo-solo && sudo docker build -t "zeek/bolo" .
