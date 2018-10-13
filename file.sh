#!/bin/bash

count=$3

echo "creating $count containers.."
sleep 2;

for i in `seq $count`
do
    echo "=============================="
    echo "Creating system$i .."
    sleep 1
    sudo docker run -d -it tomcat /bin/bash
    echo "system$i has been created!"
    echo "=============================="
done
