#!/bin/bash

if [ $# -eq 0 ]
then
echo "How to use ./supfinder Domain "
echo "Ex ./supfinder www.google.com  "
else 
$(wget $1)
sleep 5
cat index.html | grep "src=" | cut -d "=" -f 3 |cut -d '"' -f 2| cut -d "'" -f2|cut -d "/" -f3 |uniq >supDOmains.txt


for i in $(cat supDOmains.txt)
do 

if [[ $(ping -c 1 $i 2>/dev/null) ]]
then
echo " pong  ++++++++++ $i"
echo $i >> validIp.txt

else 
echo "error ----------- $i " 
fi
done
fi

for ip in $(cat validIp.txt)
do
host $ip | uniq  >>IP.txt

done
