FROM    centos:7
LABEL   MAINTAINER=ztao@gmail.com
RUN     yum install -y epel-release && \
        yum update -y && \
        yum install -y https://centos7.iuscommunity.org/ius-release.rpm mysql-devel && \
        yum install -y python36u python36u-devel && \
        yum install -y python36u-pip gcc && \
        pip3.6 install mysqlclient && \
	      yum clean all && \
	      rm -rf /var/cache/yum
