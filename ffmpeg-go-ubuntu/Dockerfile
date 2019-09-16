FROM   vikings/ffmpeg-ubuntu
RUN    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:longsleep/golang-backports && \
    apt-get update && \
    apt-get install -y golang-go
RUN mkdir -p ~/go/src