FROM debian:buster
RUN apt-get update \
    && apt-get install -y --no-install-recommends git ca-certificates python3-pip python3-dev python3-setuptools
RUN pip3 install git+https://github.com/akretion/ak@build-production-mode
RUN git config --global user.email "bot@akretion.com" && git config --global user.name "Akretion Bot"

RUN mkdir /builder
COPY bin/run-only-prod /usr/local/bin/run-only-prod
COPY bin/build-odoo /usr/local/bin/build-odoo
COPY bin/init-repo /usr/local/bin/init-repo
WORKDIR /builder
RUN init-repo
