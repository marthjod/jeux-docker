FROM ubuntu
MAINTAINER marthjod@gmail.com

RUN echo "deb http://debian.charite.de/ubuntu/ trusty main universe" > /etc/apt/sources.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -fqy \
    mysql-server

RUN sed -i -e 's/^bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/' /etc/mysql/my.cnf

ADD resources/jeuxdb-testdata.sql /tmp/jeuxdb.sql
ADD resources/startup.sh /
RUN chmod +x /startup.sh

EXPOSE 3306

CMD /startup.sh
