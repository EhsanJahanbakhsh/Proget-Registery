#!bin/bash

echo "Installing dependencies..."

#export http_proxy="http://0.0.0.0:1080"
#export https_proxy="http://0.0.0.0:1080"
#export proxy="http://0.0.0.0:1080"
apt-get update && apt-get install -y netcat && apt-get install -y curl && apt-get install -y iputils-ping 

echo "Waiting for MSSQL to start listening..."

#if nc -zvw1 192.168.1.200 1435 2 > /dev/null; then return "Succeeded"; else return "Failed"; fi
while true ; do
  if nc -zvw1 $MSSQL_PID 1433 2 > /dev/null
  then 
    echo "Succeeded"
    break
  else 
    echo -e $(date) "waiting for  succeeded"
    sleep 5 
  fi
done

/opt/mssql-tools/bin/sqlcmd -S $MSSQL_PID -U SA -P $MSSQL_SA_PASSWORD -i /opt/mssql-tools/bin/init-proget.sql

while true ; do

  /opt/mssql-tools/bin/sqlcmd -S $MSSQL_PID -U SA -P $MSSQL_SA_PASSWORD -q "select @@version"

  sleep 20s 

done
