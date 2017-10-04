FROM ubuntu:16.04
MAINTAINER Apuroop Naidu <apuroop.naidu@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y install

RUN apt-get -y install apache2

RUN apt-get -y install mysql-server mysql-client

RUN echo "mysql-server mysql-server/root_password password 12345" | debconf-set-selections

RUN echo "mysql-server mysql-server/root_password_again password 12345" | debconf-set-selections

RUN apt-get install -y \
		php7.0 \
		php7.0-mysql \
		php7.0-dev \
		php7.0-gd \
		php7.0-pspell \
		php7.0-snmp \
		snmp \
		php7.0-xmlrpc \
		libapache2-mod-php7.0 \
		php7.0-cli

EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]