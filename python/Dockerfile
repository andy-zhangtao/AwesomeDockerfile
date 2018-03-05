FROM    centos:7
LABEL   MAINTAINER=ztao@gmail.com
RUN     yum install -y epel-release && \
        yum update -y && \
        yum install -y https://centos7.iuscommunity.org/ius-release.rpm mysql-devel && \
        yum install -y python36u python36u-devel && \
        yum install -y python36u-pip gcc && \
        yum install -y libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk python-dev openssl libssl-dev libldap2-dev libsasl2-dev sqlite gcc automake && \
        pip3.6 install mysqlclient && \
	      yum clean all && \
	      rm -rf /var/cache/yum
