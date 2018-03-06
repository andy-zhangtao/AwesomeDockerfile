FROM    centos:7
LABEL   MAINTAINER=ztao@gmail.com
RUN     yum install -y epel-release && \
        yum update -y && \
        yum install -y https://centos7.iuscommunity.org/ius-release.rpm mysql-devel git make gcc && \
        yum install -y python36u python36u-devel && \
        yum install -y python36u-pip && \
        yum install -y bzip2-devel libtiff-devel libjpeg-devel libzip-devel freetype-devel lcms2-devel libwebp-devel tcl-devel tk-devel sshpass openldap-devel mysql-devel libffi-devel openssh-clients && \
        pip3.6 install mysqlclient && \
	      yum clean all && \
	      rm -rf /var/cache/yum && \
        git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
        echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile && \
        echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile && \
        echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile && \
        git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv && \
        echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
RUN     source ~/.bash_profile && \
        pyenv install 3.6.4
