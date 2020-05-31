FROM ubuntu:18.04
RUN apt-get update 1> /dev/null
RUN apt-get install -y \
    apache2 \
    mysql-server \
    wget \
    libapache2-mod-perl2 \
    libdbd-mysql-perl \
    libtimedate-perl \
    libnet-dns-perl \
    libnet-ldap-perl \
    libio-socket-ssl-perl \
    libpdf-api2-perl \
    libdbd-mysql-perl \
    libsoap-lite-perl \
    libgd-text-perl \
    libtext-csv-xs-perl \
    libjson-xs-perl \
    libgd-graph-perl \
    libapache-dbi-perl \
    libdigest-md5-perl \
    libapache2-mod-perl2 \
    libarchive-zip-perl \
    libxml-libxml-perl \
    libtemplate-perl \
    libyaml-libyaml-perl \
    libdatetime-perl \
    libencode-hanextra-perl \
    libclass-mix-perl \
    libcrypt-eksblowfish-perl \
    libyaml-perl \
    libxml-libxslt-perl \
    libc-bin \
    libmoo-perl \
    libmail-imapclient-perl 1> /dev/null
ENV OTRS_VERSION 6.0.28
RUN wget http://ftp.otrs.org/pub/otrs/otrs-$OTRS_VERSION.tar.gz 1> /dev/null
RUN tar -zxvf otrs-$OTRS_VERSION.tar.gz -C /opt 1> /dev/null; \
    mv /opt/otrs-$OTRS_VERSION /opt/otrs; \
    ln -s /opt/otrs/scripts/apache2-httpd.include.conf /etc/apache2/conf-enabled/ 1> /dev/null; \
    cp /opt/otrs/Kernel/Config.pm.dist /opt/otrs/Kernel/Config.pm 1> /dev/null
RUN useradd -d /opt/otrs/ -c 'OTRS user' otrs 1> /dev/null; \
    usermod -G www-data otrs 1> /dev/null; \
    /opt/otrs/bin/otrs.SetPermissions.pl --otrs-user otrs --web-group www-data /opt/otrs 1> /dev/null; \
    cd /opt/otrs/var/cron/ && for foo in *.dist; do cp $foo `basename $foo .dist`; done; \
	chown otrs:www-data /opt/otrs/var/cron/otrs_daemon; \
    a2enmod headers 1> /dev/null; \
	a2dismod mpm_event 1> /dev/null; \
	a2enmod mpm_prefork 1> /dev/null
CMD ["apachectl", "-D", "FOREGROUND"]