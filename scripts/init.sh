#!/bin/bash

# Start SQL Server in the background
/opt/mssql/bin/sqlservr &

# Wait for SQL Server to start
sleep 30

# Execute the SQL scripts in the init directory
for i in /docker-entrypoint-initdb.d/*.sql
do
  echo "running $i"
  /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P abcd1234! -d master -i $i
done

# Wait for SQL Server process to end
wait