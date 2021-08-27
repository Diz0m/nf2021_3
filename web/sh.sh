#!/bin/bash
#echo $test
while [ 1 == 1 ]
do
test=$(curl http://localhost:8080/status)
if [[ $test == *[redis]* ]]
then
echo "ok"
else
echo "stoped"
docker stop web53 && docker rm web53
docker run --name web53 -p 8080:8080 --network=bridge --restart=always -d web53
fi
echo "5s"
sleep 5
done
