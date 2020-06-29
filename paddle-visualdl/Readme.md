> 基于python 3.7的Paddle visualdl

镜像内使用的是python 3.7 .  使用时需要将生成的`log`文件挂载到`/log`目录中，例如:

```shell
docker run -it --rm --name visualdl -v vdlrecords.1593409478.log:/log/vdlrecords.1593402074.log -p 80:80 vikings/paddle:visualdl
```

默认使用`80`端口对外提供服务。 启动命令如下:

```
visualdl --logdir /log --host 0.0.0.0 --port 80 --public-path /visualdl
```

在浏览器通过`/visualdl`路径进行访问