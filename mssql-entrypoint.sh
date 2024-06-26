#!/bin/bash
/opt/mssql/bin/sqlservr &
sleep 30
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P abcd1234! -d master -i /docker-entrypoint-initdb.d/init.sql