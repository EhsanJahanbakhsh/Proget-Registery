FROM mcr.microsoft.com/mssql-tools as tools

ENV http_proxy="http://192.168.1.10:1080"
ENV https_proxy="http://192.168.1.10:1080"

RUN apt-get update && apt-get install -y netcat && apt-get install -y curl && apt-get install -y iputils-ping 

WORKDIR /proget

COPY init-proget.sql /proget/init-proget.sql
COPY init-proget.sh /proget/init-proget.sh

WORKDIR /proget

# ENTRYPOINT ["/bin/sh", "-c", "/proget/init-proget.sh"]