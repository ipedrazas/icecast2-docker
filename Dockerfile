FROM ubuntu:latest

MAINTAINER Ivan Pedrazas "ipedrazas@gmail"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq -y update && \
    apt-get -qq -y install icecast2 


CMD ["/etc/icecast2 -n -c /etc/icecast2/icecast.xml"]

