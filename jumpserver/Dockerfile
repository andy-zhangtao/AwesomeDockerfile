FROM  python:2.7.14-alpine3.7
LABEL MAINTAINER=ztao8607@gmail.com
RUN   apk add --update openssh sshpass python py-mysqldb py-psutil py-crypto gcc make g++ zlib-dev mysql-dev && \
      rm -rf /var/cache/apk/*
RUN   cd /tmp; wget https://github.com/jumpserver/jumpserver/archive/0.3.2-rc2.zip ; unzip 0.3.2-rc2.zip -d / ; mv /jumpserver-0.3.2-rc2 /jumpserver
WORKDIR /jumpserver
RUN   python /jumpserver/install/docker/get-pip.py &&   \
      pip install -r /jumpserver/install/docker/piprequires.txt &&  \
      pip install mysql-python && \
      rm -rf /jumpserver/docs &&   \
      cp /jumpserver/install/docker/run.sh /run.sh &&    \
      rm -rf /etc/motd && chmod +x /run.sh &&    \
      rm -rf /jumpserver/keys &&    \
      rm -rf /jumpserver/logs &&    \
      rm -rf /home &&    \
      rm -rf /etc/ssh &&    \
      rm -rf /etc/shadow &&    \
      rm -rf /etc/passwd &&    \
      cp -r /jumpserver/install/docker/useradd /usr/sbin/useradd &&    \
      cp -r /jumpserver/install/docker/userdel /usr/sbin/userdel &&    \
      chmod +x /usr/sbin/useradd &&    \
      chmod +x /usr/sbin/userdel &&    \
      mkdir -p /data/home &&    \
      mkdir -p /data/logs &&    \
      mkdir -p /data/keys &&    \
      mkdir -p /data/ssh &&    \
      cp -r /jumpserver/install/docker/shadow /data/shadow &&    \
      cp -r /jumpserver/install/docker/passwd /data/passwd &&    \
      ln -s /data/logs /jumpserver/logs &&    \
      ln -s /data/keys /jumpserver/keys &&    \
      ln -s /data/home /home &&    \
      ln -s /data/ssh /etc/ssh &&    \
      ln -s /data/passwd /etc/passwd &&    \
      ln -s /data/shadow /etc/shadow &&    \
      chmod -R 777 /jumpserver
COPY  ansible_api.py /jumpserver/jperm/ansible_api.py
COPY  connect.py /jumpserver/connect.py
COPY  run.sh /run.sh
EXPOSE 22/tcp 80/tcp
CMD   ["/bin/sh","-c","/run.sh"]
