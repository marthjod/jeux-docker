FROM ubuntu
MAINTAINER marthjod@gmail.com

RUN echo "deb http://de.archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN echo "deb http://de.archive.ubuntu.com/ubuntu trusty-updates main" >> /etc/apt/sources.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -fqy \
    vim \
    python-pip \
    python-dev \
    libmysqlclient-dev \
    git
RUN pip install \
    django \
    mysql-python

EXPOSE 8000

# from data volume container
WORKDIR /
RUN ["git", "clone", "https://github.com/marthjod/jeuxngo.git"]

WORKDIR /jeuxngo

# ENV DJANGO_SETTINGS_MODULE jeux.settings

# 127.0.0.1 won't work
CMD python manage.py migrate && \
    python manage.py runserver 0.0.0.0:8000
