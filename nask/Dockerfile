FROM debian:latest
MAINTAINER Marek Płonka
ENV DEBIAN_FRONTEND noninteractive

# dodatkowe pakiety
RUN apt-get update && \
    apt-get -y install \
        apt-file \
        bash-completion \
        dialog \
        dnsutils \
        less \
        locales \
        man \
        mc \
        net-tools \
        openssh-server \
        supervisor \
        vim

RUN mkdir /var/run/sshd
RUN echo 'root:drut' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN mkdir /root/.ssh
RUN chmod 700 /root/.ssh
ADD scripts/id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

# locales
RUN echo 'pl_PL.UTF-8 UTF-8' >> /etc/locale.gen
RUN locale-gen
RUN echo 'LANG=pl_PL.UTF-8' >> /etc/default/locale

ADD scripts/run.sh /run.sh
RUN chmod 755 /run.sh
CMD ["/run.sh"]
