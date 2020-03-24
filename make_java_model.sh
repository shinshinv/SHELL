#!/bin/bash

while read line 
do 
    arg1=`echo $line | cut -d' ' -f1`
    arg2=`echo $line | cut -d' ' -f2`
    arg3=`echo $line | cut -d' ' -f3`
    arg4=`echo $line | cut -d' ' -f4`

    var1=`echo ${arg2} | cut -c1 | tr '[A-Z]' '[a-z]'`
    var2=`echo ${arg2} | cut -c2-`

    comment="${comment}${arg2} > ${arg3} - ${arg4}\n"

    echo "@XmlElement(name=\"${arg2}\")\nprivate ${arg1} ${var1}${var2};\n"

    #if [ $arg1 == "String" ]; then
    #elif [ $arg1 == "Integer ]; then
    #else
    #fi

done < model.txt

echo $comment

