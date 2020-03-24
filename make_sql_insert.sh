#!/bin/bash


echo "INSERT INTO @TABLE ("

while read line 
do 
    arg1=`echo $line`
    echo ", ${arg1}"
done < make_sql_insert.txt

echo ")"
echo "VALUES ("

while read line
do
    arg1=`echo $line`
    echo ", #{${arg1}}"
done < make_sql_insert.txt

echo ")"
echo "ON DUPLICATE KEY UPDATE"

while read line
do
    arg1=`echo $line`
    echo ", ${arg1} = #{${arg1}}"
done < make_sql_insert.txt

echo ", UPDATE_DATE = NOW();"
