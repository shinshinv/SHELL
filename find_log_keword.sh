#!/bin/bash

KEYWORD="
1234567890
"

for key in ${KEYWORD[@]}
do
    LOGFILE=`ls -alrt /var/log/node/*service.dev* | tail -n 1 | awk '{print $8}'`
    #LOGFILE=`ls -alrt /var/log/node/*service.dev* | tail -n 3 | sed -n '1p' | awk '{print $8}'`
    echo -e "\033[33m$key\033[0m"
    echo $LOGFILE
    grep -n $key -A2 -B2 ${LOGFILE}
done
