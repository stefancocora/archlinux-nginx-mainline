#!/usr/bin/env bash

CID=`docker ps |grep nginx | awk '{print $1}'`
IP=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${CID}`

curl -m5 -v ${IP}/
