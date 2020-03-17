FROM node:8.6.0

RUN apt-get update && apt-get install -y vim

RUN \
	mkdir /usr/src/testfairy-connect && \
	cd /usr/src/testfairy-connect && \
	npm install git+https://github.com/testfairy/testfairy-connect.git

WORKDIR /usr/src/testfairy-connect

ENTRYPOINT ["node", "node_modules/testfairy-connect/service.js", "-f", "/etc/testfairy-connect/config.json"]
