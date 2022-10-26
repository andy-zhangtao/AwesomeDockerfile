# AwesomeDockerfile

Some common docker file

[镜像文档](http://dockerfile.docs.devexp.cn/)

# Auto Build

自动构建脚本在`https://gist.github.com/andy-zhangtao/8e8c0dcbc4e0b58aaa90f2502f36bddd`. 推荐使用下面命令进行构建

```
curl -sS https://gist.githubusercontent.com/andy-zhangtao/8e8c0dcbc4e0b58aaa90f2502f36bddd/raw/59c87be324fc94781f221b9a75d1b3405fe03c50/build.sh > build.sh
sh build.sh
```

或者通过下面的命令

```
sh <(curl -sS https://gist.githubusercontent.com/andy-zhangtao/8e8c0dcbc4e0b58aaa90f2502f36bddd/raw/59c87be324fc94781f221b9a75d1b3405fe03c50/build.sh)
```

在构建时会生成`vikings/imgname:<Git tag>`格式的镜像名称。如果需要指定自定义的镜像名称，在每个目录中添加 tags 文件。文件中写明镜像名称，如`vikings/kong:onbuild-`，然后构建时会生成`vikings/kong:onbuild-<Git tag>`格式的名称。

**目前暂不支持目录中存在二级目录**

#How to use these images

**vikings/golang:onbuild-<version>**

> 用来执行"优雅"的 Golang 程序构建。主要解决 golang 程序异常时，对外暴露 local 的 src 路径。构建后，所有路径都以/go/src 作为 GOPATH。

镜像支持调用 dep 来组织 vendor，如果需要调用此功能，需要设置 DEP=true. 例如:

```docker
docker run -it --rm -e DEP=true  -v $(PWD):/go/src/xxxxx vikings/golang:onbuild-<version> args1 args2
```

args1: 程序全路径。 例如:/go/src/github.com/xxxxxx. build script 会定位到此目录，然后执行`go build`
args2: 编译的程序名称. 编译成功后，会将此文件 mv 到工程 bin 目录
