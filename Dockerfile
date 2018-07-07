FROM ubuntu:16.04
MAINTAINER andras.sebo@gmail.com

RUN apt-get update && apt-get install -y apt-utils nano apt-transport-https && \
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 && \
	echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list && \
	apt-get update && apt-get install -y mongodb

RUN mkdir -p /data/db && chown -R mongodb:mongodb /data/db

EXPOSE 27017

CMD /usr/bin/mongod --journal
