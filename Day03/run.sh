#! /bin/bash
echo 'Write number from 1 to 13, like 00, 01 ...'
read num

cat_day=`grep -e ex day.txt`
day=$cat_day$num.sql

docker cp ex$num/$day sqlbc:$day

docker exec sqlbc psql -U jothosge -d psqldb -f /$day