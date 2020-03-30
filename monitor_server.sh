#!/bin/bash

while :
do
clear
for i in {1..2}
do
SERVER=dev${i}.shinshinv.com
ssh -T ${SERVER} << \EOF
HOST=`uname -n`
CW_CNT=`netstat -na | grep CLOSE | wc -l`
TR_CNT=`ps -eLf | grep service_test | grep tomcat | wc -l`
echo -e "*** [CW : \033[1;31m"${CW_CNT}"\033[0m TR : \033[1;31m"${TR_CNT}"\033[0m]    \033[1;7m"${HOST}"\033[0m"
dstat -tlcmdi --tcp -n --top-cpu --top-mem --noupdate 1 2
DT=`date +"%Y%m%d%H"`; tail -n 2 /var/log/tomcat/service_test/logback.${DT}.log | cut -c 1-200
EOF
done
sleep 10
done

