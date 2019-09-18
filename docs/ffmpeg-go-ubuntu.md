# FFMPEG-Go-Ubuntu
> ffmpeg golang cgo 构建环境

## 镜像信息
镜像名称: `vikings/ffmpeg-go-ubuntu`。 ffmpeg version: v4.2, golang:1.13


## 使用方式

在`~/go/src`中创建源码目录，CGO参考如下参数:

```golang
package main

// #cgo LDFLAGS: libcgo.a
// #cgo pkg-config: x11 vdpau libva libavdevice libavformat libavfilter libavcodec libswresample libswscale libavutil
// #include "library.h"
import "C"

func main() {
	C.hello()
}
```

