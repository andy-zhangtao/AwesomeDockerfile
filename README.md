# AwesomeDockerfile
Some common docker file

# Chang Log

### Kong (vikings/kong:onbuild-\<version\>)

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
curl -sS https://gist.githubusercontent.com/andy-zhangtao/8e8c0dcbc4e0b58aaa90f2502f36bddd/raw/56df86e5a84d63a16c4cf5c5faa34e3f40600643/build.sh > build.sh
sh build.sh
```

在构建时会生成`vikings/imgname:<Git tag>`格式的镜像名称。如果需要指定自定义的镜像名称，在每个目录中添加tags文件。文件中写明镜像名称，如`vikings/kong:onbuild-`，然后构建时会生成`vikings/kong:onbuild-<Git tag>`格式的名称。

**目前暂不支持目录中存在二级目录**
