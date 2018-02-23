# AwesomeDockerfile
Some common docker file

# Chang Log

### Kong (vikings/kong:onbuild-\<version\>)

#### v1.0.5
* Support Execute Dep when build go binary

#### v1.0.4
* Pre-install kong v0.12.0 source code

#### v1.0.3
* Use alpine as baseimage
* Openresty use 1.11.2.5

#### v1.0.1
* Pre-install lua dependencies

#### v1.0.0

* Add net-tools for check port listening

### openresty-dev

#### v1.0.2

* Downgrade openresty version. 1.13 -> 1.11

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
在构建时会生成`vikings/imgname:<Git tag>`格式的镜像名称。如果需要指定自定义的镜像名称，在每个目录中添加tags文件。文件中写明镜像名称，如`vikings/kong:onbuild-`，然后构建时会生成`vikings/kong:onbuild-<Git tag>`格式的名称。

**目前暂不支持目录中存在二级目录**


#How to use these images

**vikings/golang:onbuild-<version>**
>用来执行"优雅"的Golang程序构建。主要解决golang程序异常时，对外暴露local的src路径。构建后，所有路径都以/go/src作为GOPATH。

镜像支持调用dep来组织vendor，如果需要调用此功能，需要设置DEP=true. 例如:
```docker
docker run -it --rm -e DEP=true  -v $(PWD):/go/src/xxxxx vikings/golang:onbuild-<version> args1 args2
```

args1: 程序全路径。 例如:/go/src/github.com/xxxxxx. build script会定位到此目录，然后执行`go build`
args2: 编译的程序名称. 编译成功后，会将此文件mv到工程bin目录
