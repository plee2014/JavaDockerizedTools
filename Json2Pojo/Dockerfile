FROM openjdk:8-jdk

LABEL maintainer "Peter Lee"

ARG JSONSCHEMA2POJO_VERSION=0.4.31

WORKDIR /usr/share/jsonschema2pojo/jsonschema2pojo-$JSONSCHEMA2POJO_VERSION 

RUN curl -LS https://github.com/joelittlejohn/jsonschema2pojo/releases/download/jsonschema2pojo-$JSONSCHEMA2POJO_VERSION/jsonschema2pojo-$JSONSCHEMA2POJO_VERSION.tar.gz \
    | tar -xzC /usr/share/jsonschema2pojo/jsonschema2pojo-$JSONSCHEMA2POJO_VERSION --strip-components=1 \
  && ln -s /usr/share/jsonschema2pojo/jsonschema2pojo-$JSONSCHEMA2POJO_VERSION/bin/jsonschema2pojo /usr/bin/jsonschema2pojo



COPY jsonschema2pojo-entrypoint.sh /usr/local/bin/jsonschema2pojo-entrypoint.sh
RUN chmod +x /usr/local/bin/jsonschema2pojo-entrypoint.sh


WORKDIR /build
ENTRYPOINT ["/usr/local/bin/jsonschema2pojo-entrypoint.sh"]

#Testing 
#RUN  jsonschema2pojo --help

