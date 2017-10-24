FROM    ubuntu:14.04
RUN     apt-get update && \
        apt-get install -y software-properties-common openssh-server rsync curl wget && \
        add-apt-repository ppa:openjdk-r/ppa && \
        apt-get update && \
        apt-get install -y openjdk-8-jdk
# RUN     groupadd -r hadoop && useradd -r -m -d /home/hadoop -g hadoop hadoop && adduser hadoop sudo
# COPY    ./sudoers /etc/sudoers
# USER    hadoop

RUN     mkdir /home/hadoop && cd /tmp ; wget https://archive.apache.org/dist/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz ; \
        wget http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz ; \
        wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.1-bin-hadoop2.7.tgz ; \
        wget https://archive.apache.org/dist/hbase/1.1.0.1/hbase-1.1.0.1-bin.tar.gz; \
        wget https://archive.apache.org/dist/hive/hive-2.0.0/apache-hive-2.0.0-bin.tar.gz ; \
        wget https://cdn.mysql.com//Downloads/Connector-J/mysql-connector-java-5.1.41.tar.gz ; \
        wget http://mirrors.tuna.tsinghua.edu.cn/apache/kylin/apache-kylin-1.6.0/apache-kylin-1.6.0-hbase1.x-bin.tar.gz; \
        tar -xzf /tmp/apache-hive-2.0.0-bin.tar.gz -C /home/hadoop ; \
        tar -xzf /tmp/mysql-connector-java-5.1.41.tar.gz -C /home/hadoop ; \
        tar -xzf /tmp/hadoop-2.7.3.tar.gz -C /home/hadoop ; \
        tar -xzf /tmp/scala-2.11.8.tgz -C /home/hadoop ; \
        tar -xzf /tmp/spark-2.0.1-bin-hadoop2.7.tgz -C /home/hadoop ; \
        tar -xzf /tmp/hbase-1.1.0.1-bin.tar.gz -C /home/hadoop; \
        tar -xzf /tmp/apache-kylin-1.6.0-hbase1.x-bin.tar.gz -C /home/hadoop; \
        cp /home/hadoop/mysql-connector-java-5.1.41/mysql-connector-java-5.1.41-bin.jar /home/hadoop/apache-hive-2.0.0-bin/lib; \
        rm -rf /tmp/*.tgz ; \
        rm -rf /tmp/*.tar.gz

ENV     JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV     HADOOP_PREFIX=/home/hadoop/hadoop-2.7.3
ENV     HADOOP_HOME_PRE=/home/hadoop
ENV     HADOOP_HOME=$HADOOP_HOME_PRE/hadoop-2.7.3
ENV     HADOOP_LOG_DIR=$HADOOP_HOME_PRE/logs/hadoop
ENV     YARN_LOG_DIR=$HADOOP_HOME_PRE/logs/yarn
ENV     HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop
ENV     SCALA_HOME=$HADOOP_HOME_PRE/scala-2.11.8
ENV     SPARK_HOME=$HADOOP_HOME_PRE/spark-2.0.1-bin-hadoop2.7
ENV     HBASE_HOME=$HADOOP_HOME_PRE/hbase-1.1.0.1
ENV     HIVE_HOME=$HADOOP_HOME_PRE/apache-hive-2.0.0-bin
ENV     KYLIN_HOME=$HADOOP_HOME_PRE/apache-kylin-1.6.0-hbase1.x-bin
ENV     HADOOP_CLASSPATH=:$HBASE_HOME/lib/*
ENV     HBASE_CONF_DIR=$HBASE_HOME/conf
ENV     CLASSPATH=${CLASSPATH}:${HBASE_HOME}/conf/hbase-site.xml
ENV     PATH=$PATH:$HADOOP_PREFIX/bin:$HADOOP_PREFIX/sbin:$SCALA_HOME/bin:$SPARK_HOME/bin:$HBASE_HOME/bin:$HIVE_HOME/bin:.

COPY    ssh_config		/etc/ssh_config
COPY    profile                 /etc/profile
COPY    sshd_config             /etc/ssh/sshd_config
COPY    authorized_keys         $HADOOP_HOME_PRE/.ssh/authorized_keys
COPY    id_dsa                  $HADOOP_HOME_PRE/.ssh/id_dsa_bak
COPY    hadoop_start.sh 	$HADOOP_HOME_PRE/hadoop_start.sh
# COPY    core-site-slave.xml     $HADOOP_HOME_PRE/core-site-slave.xml
# COPY    hadoop-env.sh 	        $HADOOP_HOME_PRE/hadoop-2.7.3/etc/hadoop/hadoop-env.sh
# COPY    core-site.xml 	        $HADOOP_HOME_PRE/hadoop-2.7.3/etc/hadoop/core-site.xml
# COPY    yarn-site.xml		$HADOOP_HOME_PRE/hadoop-2.7.3/etc/hadoop/yarn-site.xml
# COPY    mapred-site.xml	        $HADOOP_HOME_PRE/hadoop-2.7.3/etc/hadoop/mapred-site.xml
# COPY    slaves                  $HADOOP_HOME_PRE/hadoop-2.7.3/etc/hadoop/slaves
# COPY    hdfs-site.xml           $HADOOP_HOME_PRE/hadoop-2.7.3/etc/hadoop/hdfs-site.xml
# COPY    slaves.sh  		$HADOOP_HOME_PRE/hadoop-2.7.3/sbin/slaves.sh
# COPY    yarn-daemon.sh          $HADOOP_HOME_PRE/hadoop-2.7.3/sbin/yarn-daemon.sh
# COPY    hbase-site-slave.xml    $HADOOP_HOME_PRE/hbase-site-slave.xml
# COPY    hbase-site.xml          $HADOOP_HOME_PRE/hbase-1.1.0.1/conf/hbase-site.xml
# COPY    hbase-env.sh            $HADOOP_HOME_PRE/hbase-1.1.0.1/conf/hbase-env.sh
# COPY    hive-site.xml           $HIVE_HOME/conf/hive-site.xml


VOLUME  /conf
WORKDIR "/home/hadoop"
EXPOSE  6066 8040 8042 8088 9000 19888 19889 50070 8025 9100
CMD     ["hadoop_start.sh"]
