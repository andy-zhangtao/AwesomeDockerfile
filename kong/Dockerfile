# vikings/kong:onbuild
FROM	vikings/openresty:8-debian-1.11
RUN		apt-get install -y unzip make gcc libssl-dev git net-tools curl && \
		wget https://github.com/luarocks/luarocks/archive/2.4.3.tar.gz && \
		tar -zxvf 2.4.3.tar.gz && \
		cd /luarocks-2.4.3 && \
		./configure   --lua-suffix=jit   --with-lua=/usr/local/openresty/luajit   --with-lua-include=/usr/local/openresty/luajit/include/luajit-2.1 && \
		make build && \
		make install
RUN curl -sS https://gist.githubusercontent.com/andy-zhangtao/c444279b6a5ccc255b8cd9c973c57cd4/raw/e0871aeaf2eb3f4c9c5922ce7d019c3807b9b6e0/kong-0.11.2-0.rockspec > /kong-0.11.2-0.rockspec && \
		luarocks make OPENSSL_INCDIR=/usr/include /kong-0.11.2-0.rockspec
