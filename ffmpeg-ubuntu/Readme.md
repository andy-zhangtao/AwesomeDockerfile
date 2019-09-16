# FFMPEG
> FFMPEG ubuntu(18.04)开发环境

镜像名称: vikings/ffmpeg-ubuntu . ffmpeg version: v4.2

此镜像包含了ffmpeg 源码(~/ffmpeg-source/ffmpeg目录)，并且构建为静态库。 构建镜像时需要下载`aom`，因此需要设置翻墙。

构建交付物:

```
.a:
/root/ffmpeg_build/lib
```

```
.h:
/root/ffmpeg_build/include
```

```
doc:
/root/ffmpeg_build/share
```