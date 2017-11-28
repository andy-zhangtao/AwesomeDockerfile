
4. Copy the client configuration files to "kylin-docker/conf" folder, overwriting those template files;
  ```
  cp -rf ~/hadoop-conf/* conf/
  ```

5. Build docker image, which may take a while, just take a cup of tea; 
  ```
  docker build -t kyligence/kylin:152 .
  ```

  After the build finished, should be able to see the image with "docker images" commmand;
  ```
  [root@ip-10-0-0-38 ~]# docker images  
  REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE  
  kyligence/kylin     152                 7ece32097fa3        About an hour ago   3.043 GB  
  ```

6. Now you can run a contianer with the bootstrap command (in which will start Kylin server). The "-bash" argument is telling to keep in bash so you can continue to run bash commands; If don't need, you can use the "-d" argument:
  ```
[root@ip-10-0-0-38 ~]# docker run -i -t -p 7070:7070 kyligence/kylin:152 /etc/bootstrap.sh -bash  
Generating SSH1 RSA host key:                              [  OK  ]  
Starting sshd:                                             [  OK  ]  
KYLIN_HOME is set to /usr/local/kylin/bin/../  
kylin.security.profile is set to ldap  
16/06/30 04:50:31 WARN conf.HiveConf: HiveConf of name hive.optimize.mapjoin.mapreduce does not exist  
16/06/30 04:50:31 WARN conf.HiveConf: HiveConf of name hive.heapsize does not exist  
16/06/30 04:50:31 WARN conf.HiveConf: HiveConf of name hive.server2.enable.impersonation does not exist  
16/06/30 04:50:31 WARN conf.HiveConf: HiveConf of name hive.auto.convert.sortmerge.join.noconditionaltask does not exist  
Logging initialized using configuration in file:/etc/hive/conf/hive-log4j.properties  
HCAT_HOME not found, try to find hcatalog path from hadoop home  
A new Kylin instance is started by , stop it using "kylin.sh stop"  
Please visit http://<ip>:7070/kylin  
You can check the log at /usr/local/kylin/bin/..//logs/kylin.log  
  ```

7. After a minute, you can open web browser with address http://host:7070/kylin , here the "host" is the hostname or IP address of the hosting machine which runs Docker; Its 7070 port will redirect to the contianer's 7070 port as we specified in the "docker run" command; You can change to other port as you like.

8. Now you can use Kylin as usually: import Hive tables, design cubes, build, query, etc. 

## Thanks

Thanks to SequenceIQ's [hadoop-docker](https://github.com/sequenceiq/hadoop-docker/) and other projects, which inspires us on developing this. 