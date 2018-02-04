FROM debian:latest
MAINTAINER Marek Płonka
ENV DEBIAN_FRONTEND noninteractive

# dodatkowe pakiety
RUN apt-get update && \
    apt-get -y install \
        apt-file \
        apt-transport-https \
        bash-completion \
        binutils \
        deborphan \
        dialog \
        dnsutils \
        gawk \
        htop \
        less \
        locales \
        lsb-release \
        lsof \
        man \
        mc \
        mlocate \
        net-tools \
        netcat-openbsd \
        nginx-full \
        ntp \
        openssh-server \
        openssl \
        rsync \
        sudo \
        tcpdump \
        tmux \
        tree \
        vim \
        wajig

RUN mkdir /var/run/sshd
RUN echo 'root:drut' | chpasswd
RUN sed -i.orig -e 's/^PermitRootLogin\s.*\|^#.*PermitRootLogin\s.*/PermitRootLogin yes/' /etc/ssh/sshd_config

# locales
RUN echo 'pl_PL.UTF-8 UTF-8' >> /etc/locale.gen
RUN locale-gen
RUN echo 'LANG=pl_PL.UTF-8' >> /etc/default/locale

ADD scripts/run.sh /run.sh
RUN chmod 755 /run.sh
CMD ["/run.sh"]
