FROM node:8.6.0

RUN \
	echo yo && \
	mkdir /usr/src/testfairy-connect && \
	cd /usr/src/testfairy-connect && \
	npm install git+https://github.com/testfairy/testfairy-connect.git

WORKDIR /usr/src/testfairy-connect

ENV PATH /usr/src/testfairy-connect:$PATH

ENTRYPOINT ["node", "node_modules/testfairy-connect/service.js"]

