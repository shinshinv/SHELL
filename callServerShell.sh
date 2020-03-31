#!/bin/bash

for i in {1..8}
do
    SERVER=test${i}.shinshinv.com
    echo "=================================================="
    echo $SERVER
    echo "=================================================="
    ssh ${SERVER} < command.sh
done

