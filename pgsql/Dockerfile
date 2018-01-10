FROM postgres:9.6
MAINTAINER Marek Płonka
ENV DEBIAN_FRONTEND noninteractive

#VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# dodatkowe pakiety
RUN apt-get update && \
    apt-get -y install \
        less \
        locales \
        net-tools \
        supervisor \
        vim

#       supervisor \

# locales
RUN echo 'pl_PL.UTF-8 UTF-8' >> /etc/locale.gen
RUN locale-gen
RUN echo 'LANG=pl_PL.UTF-8' >> /etc/default/locale

RUN (export LANGUAGE=pl; export LC_ALL=pl_PL.UTF-8; export LANG=pl_PL.UTF-8; pg_createcluster 9.6 main)

ADD scripts/run.sh /run.sh
RUN chmod 755 /run.sh

#USER postgres
CMD ["/run.sh"]

