#!/bin/bash

sleep 60
#run the setup script to create the DB and the schema in the DB
#do this in a loop because the timing for when the SQL instance is ready is indeterminate
for i in {1..100};
do
    echo "Sending mssql_connector.json to Debezium Connect, attempt $i of 100"
    status_code=$(curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" debezium:8083/connectors/ --data-binary "@mssql_connector.json" --write-out %{http_code} --silent --output /dev/null)

    if [[ "$status_code" -eq 201 ]] ; then
        echo "Debezium connector added"
        break
    elif [[ "$status_code" -eq 409 ]] ; then
        echo "Debezium already connector added"
        break
    else
        echo "Debezium not ready yet... HTTP status code = $status_code"
        sleep 1
    fi
done
