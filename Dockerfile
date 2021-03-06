FROM debian:buster
RUN apt-get update \
    && apt-get install -y --no-install-recommends git ca-certificates python3-pip python3-dev python3-setuptools
RUN pip3 install git+https://github.com/akretion/ak@2.0.7
RUN git config --global user.email "bot@akretion.com" && git config --global user.name "Akretion Bot"

RUN mkdir -p /builder/links
COPY bin/build-odoo /usr/local/bin/build-odoo
COPY bin/build-odoo-external /usr/local/bin/build-odoo-external
COPY bin/init-repo /usr/local/bin/init-repo
WORKDIR /builder
RUN init-repo

# Extra cmd tools
COPY bin/update-spec /usr/local/bin/update-spec
