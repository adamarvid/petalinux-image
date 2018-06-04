#!/bin/sh

docker build --no-cache --build-arg USER_ID=`id -u $USER` -t buildroot-ci:latest .
#docker build --build-arg USER_ID=`id -u $USER` -t buildroot-ci:latest .
