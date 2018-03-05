FROM    centos:7
LABEL   MAINTAINER=ztao@gmail.com
RUN     yum install -y epel-release && \
        yum update -y && \
        yum install -y https://centos7.iuscommunity.org/ius-release.rpm mysql-devel && \
        yum install -y python36u python36u-devel && \
        yum install -y python36u-pip gcc && \
        yum install -y libtiff-devel libjpeg-devel libzip-devel freetype-devel lcms2-devel libwebp-devel tcl-devel tk-devel sshpass openldap-devel mysql-devel libffi-devel openssh-clients && \
        pip3.6 install mysqlclient && \
	      yum clean all && \
	      rm -rf /var/cache/yum
