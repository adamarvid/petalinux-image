#!/bin/sh

docker build --no-cache --build-arg WITH_XILINX=true --build-arg USER_ID=`id -u $USER` -t 618:latest .
#docker build --build-arg WITH_XILINX=true --build-arg USER_ID=`id -u $USER` -t 618:latest .
