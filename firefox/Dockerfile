FROM debian:latest
MAINTAINER Marek Płonka
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install firefox-esr
#RUN apt-get -y install sudo && apt-get -y install netsurf-gtk

RUN groupadd -g 1000 plona && \
    useradd -g 1000 -u 1000 -s /bin/bash -m plona
#RUN echo "plona ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/plona

USER plona 
ENV HOME /home/plona 
CMD /usr/bin/firefox
#CMD /bin/bash
