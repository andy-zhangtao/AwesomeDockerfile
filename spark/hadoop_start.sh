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
# ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
# cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys

#configure core-stie.xml
# if [ -n "$NAMENODE" ]; then
# 	sed -i 's/HOSTNAME/'$HOSTNAME'/g' $HADOOP_HOME_PRE/hadoop-2.7.3/etc/hadoop/core-site.xml
# 	sed -i 's/namenode/'$HOSTNAME'/g' $HADOOP_HOME_PRE/hadoop-2.7.3/etc/hadoop/yarn-site.xml
# 	sed -i 's/namenode/'$HOSTNAME'/g' $HADOOP_HOME_PRE/hadoop-2.7.3/etc/hadoop/mapred-site.xml
# 	sed -i 's/HOSTNAME/'$HOSTNAME'/g' $HADOOP_HOME_PRE/hbase-1.1.0.1/conf/hbase-site.xml
# 	sed -i 's/HOSTNAME/'$HOSTNAME'/g' $HADOOP_HOME_PRE/apache-hive-2.0.0-bin/conf/hive-site.xml
# fi

if [ -d "/conf/hadoop" ]; then
	cp -r /conf/hadoop/* $HADOOP_HOME_PRE/hadoop-2.7.3/etc/hadoop
else
	echo "Can not find the hadoop configure!"
fi

if [ -d "/conf/hbase" ]; then
	cp -r /conf/hbase/* $HADOOP_HOME_PRE/hbase-1.1.0.1/conf
else
	echo "Can not find the hbase configure!"
fi

if [ -d "/conf/hive" ]; then
	cp -r /conf/hive/* $HADOOP_HOME_PRE/apache-hive-2.0.0-bin/conf
else
	echo "Can not find the hive configure!"
fi

if [ -d "/conf/kylin" ]; then
	cp -r /conf/kylin/* $KYLIN_HOME/conf
else
	echo "Can not find the kylin configure!"	
fi

#start namendoe
if [ -n "$NAMENODE" ]; then
	sudo chown -R hadoop:hadoop $HADOOP_PREFIX
	chmod -R 600 $HADOOP_HOME_PRE/.ssh
	mv $HADOOP_HOME_PRE/.ssh/id_dsa_bak $HADOOP_HOME_PRE/.ssh/id_dsa
	chmod 755 $HADOOP_HOME_PRE/hadoop-2.7.3/sbin/yarn-daemon.sh

	hdfs namenode -format
	#start-dfs.sh
	$HADOOP_PREFIX/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start namenode
	$HADOOP_PREFIX/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager
	$HADOOP_PREFIX/sbin/yarn-daemon.sh start proxyserver --config $HADOOP_CONF_DIR
	$HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh start historyserver --config $HADOOP_CONF_DIR
	$SPARK_HOME/sbin/start-all.sh
	$HBASE_HOME/bin/start-hbase.sh
	$KYLIN_HOME/bin/kylin.sh start
	$HIVE_HOME/bin/schematool -dbType mysql -initSchema
	$HIVE_HOME/bin/hive --service metastore 
fi

#start datanode
if [ -n "$DATANODE" ]; then
	#hdfs datanode
	mv -f $HADOOP_HOME_PRE/core-site-slave.xml $HADOOP_PREFIX/etc/hadoop/core-site.xml
	mv -f $HADOOP_HOME_PRE/hbase-site-slave.xml $HADOOP_HOME_PRE/hbase-1.1.0.1/conf/hbase-site.xml
	$HADOOP_PREFIX/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start datanode
	$HADOOP_PREFIX/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start nodemanager
	$SPARK_HOME/sbin/start-slave.sh $SPARK_MASTER_URL
fi

tail -f $HOME/logs/*/*.log
