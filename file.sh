#!/bin/bash

count=$10

echo "creating $count containers.."
sleep 2;

for i in `seq $count`
do
    echo "=============================="
    echo "Creating system$i .."
    sleep 1
    docker run --name newsystem$i -d -it raghudevops21/nginx.img /bin/bash
    echo "system$i has been created!"
    echo "=============================="
done
