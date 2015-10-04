FROM ubuntu:latest

MAINTAINER Ivan Pedrazas "ipedrazas@gmail"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:unit193/test

RUN apt-get update && apt-get install -y icecast2 ices2 && rm -rf /var/lib/apt/lists/*


ADD audio /stream
ADD . /app

RUN mkdir -p /var/log/ices/  &&  chmod 777 /var/log/ices/ && chmod +x /app/start.sh && chown -R icecast2.icecast /app

USER icecast2
WORKDIR /app

# docker run -it --rm  -p 8000:8000 --name icecast2 -v /etc/localtime:/etc/localtime:ro ipedrazas/icecast bash -c "icecast2 -c icecast.xml"
 # docker run -it --rm --link icecast2:icecast2 ipedrazas/icecast bash -c "ices2 -c icecast-playlist.xml"
