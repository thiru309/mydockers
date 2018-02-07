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

# root & ssh - do usunięcia w przyszłości
RUN mkdir /var/run/sshd
RUN echo 'root:drut' | chpasswd
RUN sed -i.orig -e 's/^PermitRootLogin\s.*\|^#.*PermitRootLogin\s.*/PermitRootLogin yes/' /etc/ssh/sshd_config

# locales
RUN echo 'pl_PL.UTF-8 UTF-8' >> /etc/locale.gen
RUN locale-gen
RUN echo 'LANG=pl_PL.UTF-8' >> /etc/default/locale

# timezone
RUN echo 'Europe/Warsaw' > /etc/timezone && \
    cd /etc && \
    ln -sf /usr/share/zoneinfo/Europe/Warsaw localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# katalogi wspólne (media i my-media)
RUN mkdir /media-storage && \
    chmod 777 /media-storage
RUN mkdir /my-media && \
    chmod 777 /my-media

# nginx - wszystko do poprawy
ADD scripts/default /etc/nginx/sites-available/default
ADD scripts/sklep-n.html /var/www/html/sklep-n.html
RUN cd /var/www/html && \
    mv index.nginx-debian.html index.nginx-debian.html.orig
RUN cd /var/www/html && \
    ln -s sklep-n.html index.nginx-debian.html 

ADD scripts/run.sh /run.sh
RUN chmod 755 /run.sh
CMD ["/run.sh"]
