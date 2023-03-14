FROM mcr.microsoft.com/mssql/server

COPY entrypoint.sh entrypoint.sh
COPY setup_database.sh setup_database.sh
COPY setup_data.sql setup_data.sql
COPY setup_debezium_connector.sh setup_debezium_connector.sh
COPY mssql_connector.json mssql_connector.json

USER root
RUN apt-get update && apt-get install -y curl
# USER mssql

ENTRYPOINT /bin/bash ./entrypoint.sh