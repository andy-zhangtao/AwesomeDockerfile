# spark
The spark docker image dockerfile


## How to create hadoop master ?

```
docker run -d --name hadoop-namenode -p 9000:9000 -p 50070:50070 -p 18088:8088 -p 19888:19888  -e NAMENODE=true vikings/spark
```

## How to create hadoop slave ?

```
docker run -d --name hadoop-datanode1 -p 51070:50070 -p 28088:8088 -p 29888:19888  --link hadoop-namenode:namenode -e DATANODE=true   vikings/spark

```
Notice:

Slave must use:

<b>--link hadoop-namenode:namenode -e DATANODE=true </b>

Currently, master and slave <b>must exist</b> in the same host!!
