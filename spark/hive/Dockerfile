FROM    ubuntu:14.04
RUN     apt-get update && \
        apt-get install -y software-properties-common openssh-server rsync curl wget && \
        add-apt-repository ppa:openjdk-r/ppa && \
        apt-get update && \
        apt-get install -y openjdk-8-jdk
RUN     groupadd -r hadoop && useradd -r -m -d /home/hadoop -g hadoop hadoop && adduser hadoop sudo
COPY    ./sudoers /etc/sudoers
USER    hadoop
RUN     cd /tmp ; wget https://archive.apache.org/dist/hive/hive-2.0.0/apache-hive-2.0.0-bin.tar.gz ; \
        wget https://cdn.mysql.com//Downloads/Connector-J/mysql-connector-java-5.1.41.tar.gz ; \
        tar -xzf /tmp/apache-hive-2.0.0-bin.tar.gz -C /home/hadoop ; \
        tar -xzf /tmp/mysql-connector-java-5.1.41.tar.gz -C /home/hadoop ; \
        rm -rf /tmp/*.tar.gz; \
        cp /home/hadoop/mysql-connector-java-5.1.41/mysql-connector-java-5.1.41-bin.jar /home/hadoop/apache-hive-2.0.0-bin/lib 

ENV     JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV     HIVE_HOME=/home/hadoop/apache-hive-2.0.0-bin
ENV     PATH=$PATH:$HIVE_HOME/bin:.

COPY    hive_start.sh /hive_start.sh
COPY    hive-site.xml /home/hadoop/apache-hive-2.0.0-bin/conf/hive-site.xml
CMD     ["/hive_start.sh"]
