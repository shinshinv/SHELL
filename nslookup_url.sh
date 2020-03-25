#!/bin/bash

while read line
do
    subdomain=`echo $line`
    echo $subdomain
    
    domain_list="
    ${subdomain}.google.com
    ${subdomain}.naver.com
    "
    for domain in ${domain_list[*]}
    do
        domain_ip=`nslookup ${domain} | grep Add | grep -v "#" | awk '{print $2}'`
        echo "${domain}	${domain_ip}"
    done    
done < subdomain.txt
