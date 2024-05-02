#! /bin/bash

day=`ls | grep -e day`

docker cp $day sqlbc:$day

docker exec sqlbc psql -U jothosge -d psqldb -f /$day