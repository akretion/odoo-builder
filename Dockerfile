FROM debian:buster
RUN apt-get update && apt-get install -y --no-install-recommends git python3 ca-certificates
RUN mkdir /builder
COPY bin/init-repo /usr/local/bin/init-repo
WORKDIR /builder
RUN init-repo
