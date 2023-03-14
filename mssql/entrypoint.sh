#!/usr/bin/env bash
set -m
CONTAINER_FIRST_STARTUP="CONTAINER_FIRST_STARTUP"
if [ ! -e /$CONTAINER_FIRST_STARTUP ]; then
    touch /$CONTAINER_FIRST_STARTUP
    echo "-- First container startup --"
    ./setup_database.sh &
    ./setup_debezium_connector.sh &
else
    echo "-- Not first container startup --"
fi

./opt/mssql/bin/sqlservr