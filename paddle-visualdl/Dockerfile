FROM python:3.7-stretch
RUN  pip install --upgrade --pre visualdl -i https://mirror.baidu.com/pypi/simple && \
    mkdir /log
ENTRYPOINT ["visualdl","--logdir","/log","--host","0.0.0.0","--port","80","--public-path","/visualdl"]