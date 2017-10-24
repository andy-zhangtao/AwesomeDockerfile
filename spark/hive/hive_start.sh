#!/bin/bash

#start the ssh service

#sudo echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
#sudo echo "UserKnownHostsFile /dev/null" >> /etc/ssh/ssh_config
sudo /etc/init.d/ssh start
sudo passwd hadoop <<!
hadoop
hadoop
!
#create the id_dsa
ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys

#configure core-stie.xml
if [ -n "$NAMENODE" ]; then
	sed -i 's/HOSTNAME/'$HOSTNAME'/g' $HIVE_HOME/conf/hive-site.xml
fi

#start namendoe
# if [ -n "$NAMENODE" ]; then
# 	hdfs namenode -format
# 	#start-dfs.sh
# 	$HADOOP_PREFIX/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start namenode
# 	$HADOOP_PREFIX/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager
# 	$HADOOP_PREFIX/sbin/yarn-daemon.sh start proxyserver --config $HADOOP_CONF_DIR
# 	$HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh start historyserver --config $HADOOP_CONF_DIR
# 	$SPARK_HOME/sbin/start-all.sh
# 	$HBASE_HOME/bin/start-hbase.sh
# fi

# #start datanode
# if [ -n "$DATANODE" ]; then
# 	#hdfs datanode
# 	mv -f $HADOOP_HOME/core-site-slave.xml $HADOOP_PREFIX/etc/hadoop/core-site.xml
# 	mv -f $HADOOP_HOME/hbase-site-slave.xml $HADOOP_HOME/hbase-1.1.0.1/conf/hbase-site.xml
# 	$HADOOP_PREFIX/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start datanode
# 	$HADOOP_PREFIX/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start nodemanager
# 	$SPARK_HOME/sbin/start-slave.sh $SPARK_MASTER_URL
# fi

# tail -f $HOME/logs/*/*.log
hive --service metastore