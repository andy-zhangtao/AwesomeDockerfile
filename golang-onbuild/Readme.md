此镜像用来构建golang编译环境，当需要构建"友好"的golang程序时，将程序源码挂载到此镜像中，然后输入两个参数,
参数一： 程序全路径 /go/src/github.com/xxxxxx
参数二： 编译的程序名称
最终程序会放到bin目录中

## vikings/golang:onbuild-dep
> 这个镜像包含了dep工具，用来自动执行dep命令生成/更新vendor依赖包

默认只会执行dep. 如果需要同时构建二进制程序，需要-e BUILD=true.
