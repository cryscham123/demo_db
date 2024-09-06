#!/bin/bash

ACCEPT_EULA=Y /opt/mssql/bin/sqlservr &
PID=$!
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P 'QkrQkrdl!@#4' -C -i /app/cms.sql
kill -9 $PID
