#! /bin/bash
echo 'Write number from 1 to 8, like 00, 01 ...'
read num

cat_day=`ls | grep -e day`
day=$cat_day$num.sql

docker cp ex$num/$day sqlbc:$day

docker exec sqlbc psql -U jothosge -d psqldb -f /$day