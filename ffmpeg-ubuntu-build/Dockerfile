FROM vikings/ffmpeg-ubuntu
ONBUILD COPY Makefile /root/ffmpeg_sources/ffmpeg/libavfilter/Makefile
ONBUILD COPY *.c /root/ffmpeg_sources/ffmpeg/libavfilter/
ONBUILD RUN cd ~/ffmpeg_sources/ffmpeg && \
    PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
    --prefix="$HOME/ffmpeg_build" \
    --pkg-config-flags="--static" \
    --extra-cflags="-I$HOME/ffmpeg_build/include" \
    --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
    --extra-libs="-lpthread -lm" \
    --bindir="$HOME/bin" \
    --enable-gpl \
    --enable-libaom \
    --enable-libass \
    --enable-libfdk-aac \
    --enable-libfreetype \
    --enable-libmp3lame \
    --enable-libopus \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libx264 \
    --enable-libx265 \
    --enable-nonfree && \
    PATH="$HOME/bin:$PATH" && \
    cd ~/ffmpeg_sources/ffmpeg && \
    make && \
    make install