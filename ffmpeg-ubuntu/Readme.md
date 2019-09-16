# FFMPEG
> FFMPEG ubuntu(18.04)开发环境

### 镜像信息
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

### 使用方式

此镜像包含了FFMPEG构建所需的所有依赖,编写完代码之后，只需要配置makefile即可直接编译。 下面的makefile仅供参考:

```makefile
# 构建成可执行文件
FFMPEG_LIBS=    libavdevice                        \
                libavformat                        \
                libavfilter                        \
                libavcodec                         \
                libswresample                      \
                libswscale                         \
                libavutil

PKG_CFG_LIBS=   x11                                \
                vdpau                              \
                libva                              \
                $(FFMPEG_LIBS)

TARGET = <可执行文件名称>
LIBS = -lm
CC = gcc
CFLAGS += -O2 -g -O0
CFLAGS := $(shell pkg-config --cflags $(PKG_CFG_LIBS)) $(CFLAGS)
LDLIBS := $(shell pkg-config --libs $(PKG_CFG_LIBS)) $(LDLIBS)

.PHONY: default all clean

default: $(TARGET)
all: default

OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) $(LIBS) $(LDLIBS) -o $@

clean:
	-rm -f *.o
	-rm -f $(TARGET)
```

```makefile
# 构建静态库
FFMPEG_LIBS=    libavdevice                        \
                libavformat                        \
                libavfilter                        \
                libavcodec                         \
                libswresample                      \
                libswscale                         \
                libavutil

PKG_CFG_LIBS=   x11                                \
                vdpau                              \
                libva                              \
                $(FFMPEG_LIBS)

TARGET = <静态库名称>
LIBS = -lm
CC = gcc
CFLAGS += -O2 -g -O0
CFLAGS := $(shell pkg-config --cflags $(PKG_CFG_LIBS)) $(CFLAGS)
LDLIBS := $(shell pkg-config --libs $(PKG_CFG_LIBS)) $(LDLIBS)

.PHONY: default all clean

default: $(TARGET)
all: default

OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	ar rcs $@ $^

clean:
	-rm -f *.o
	-rm -f $(TARGET)
```
