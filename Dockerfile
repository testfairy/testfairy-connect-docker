FROM node:argon

RUN mkdir /usr/src/testfairy-connect && \
	curl -SL https://github.com/testfairy/testfairy-connect/releases/download/1.6.0/testfairy-connect.tgz | tar -xzC /usr/src/testfairy-connect

WORKDIR /usr/src/testfairy-connect

RUN touch configure && \
    chmod u+x configure && \
    echo "#!/bin/bash" >> configure && \
    echo "node service-configure.js -f /etc/testfairyconnect/config.json" >> configure

ENV PATH /usr/src/testfairy-connect:$PATH

CMD ["node", "service-run.js", "-f", "/etc/testfairyconnect/config.json"]
