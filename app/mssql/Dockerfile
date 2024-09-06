FROM mcr.microsoft.com/mssql/server:2022-latest

COPY scripts/ /app

# RUN  \ 
#   sed "s/\$MSSQL_SA_PASSWORD/$MSSQL_SA_PASSWORD/g" /app/db-create.sh; \
#   sed "s/\$APP_PASSWORD/$APP_PASSWORD/g" /app/cms.sql; \
#   /app/db-create.sh
RUN /app/db-create.sh
