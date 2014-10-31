FROM ubuntu
MAINTAINER marthjod@gmail.com

RUN echo "deb http://debian.charite.de/ubuntu/ trusty main universe" > /etc/apt/sources.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -fqy \
    vim \
    git

RUN ["git", "clone", "https://github.com/marthjod/jeuxngo.git"]
RUN sed -i -e "s/\(\s*\)'HOST': '.*'/\1'HOST': 'db'/" /jeuxngo/jeux/settings.py
RUN sed -i -e "s/\(\s*\)'PASSWORD': '.*'/\1'PASSWORD': '1234'/" /jeuxngo/jeux/settings.py

VOLUME /jeuxngo

CMD /bin/bash