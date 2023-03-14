#!/bin/bash

sleep 30
#run the setup script to create the DB and the schema in the DB
#do this in a loop because the timing for when the SQL instance is ready is indeterminate
for i in {1..100};
do
    echo "Initializing DB via setup_data.sql script, attempt $i of 100"
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -d master -i setup_data.sql
    if [ $? -eq 0 ]
    then
        echo "DB initialized "
        break
    else
        echo "DB not ready yet..."
        sleep 1
    fi
done
