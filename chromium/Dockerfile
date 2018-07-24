FROM debian:latest
MAINTAINER Marek Płonka
ENV DEBIAN_FRONTEND noninteractive

# installation
RUN apt-get update && \
    apt-get -y install \
        chromium \
        chromium-l10n \
        vim-tiny \
        locales

# user and exchange dir
RUN groupadd -g 1000 plona && \
    useradd -g 1000 -u 1000 -s /bin/bash -m plona && \
    mkdir /home/plona/chromium && \
    chown plona:plona /home/plona/chromium

# chromium policies
RUN mkdir -p /etc/chromium/policies/managed && \
    mkdir /etc/chromium/policies/recommended
ADD scripts/chromium.json /etc/chromium/policies/managed/chromium.json

# locales
RUN echo 'pl_PL.UTF-8 UTF-8' >> /etc/locale.gen
RUN locale-gen
RUN echo 'LANG=pl_PL.UTF-8' >> /etc/default/locale

ADD scripts/run.sh /run.sh
RUN chmod 755 /run.sh

USER plona 
ENV HOME /home/plona 
CMD ["/run.sh"]

