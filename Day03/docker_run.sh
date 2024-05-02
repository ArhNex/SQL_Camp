#! bin/bash
run_sqlbc=`docker ps | grep sqlbc | awk '{print $11}'`
if [[ $run_sqlbc == *"sqlbc"* ]]
then
    echo sqlbc is runing!
else 
    docker run --name sqlbc -p 5432:5432 -e POSTGRES_USER=jothosge -e POSTGRES_PASSWORD=12345 -e POSTGRES_DB=psqldb -d postgres
    docker cp ../materials/model.sql sqlbc:/model.sql
    docker exec sqlbc psql -U jothosge -d psqldb -f /model.sql
fi
# alias psql='docker exec sqlbc psql -U jothosge psqldb -c'

# И потом команды SQL можешь писать вот так просто из своего терминала