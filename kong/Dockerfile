# vikings/kong:onbuild
FROM	vikings/openresty:debian-8-1.13
RUN		apt-get install -y unzip make gcc libssl-dev git net-tools && \
		wget https://github.com/luarocks/luarocks/archive/2.4.3.tar.gz && \
		tar -zxvf 2.4.3.tar.gz && \
		cd /luarocks-2.4.3 && \
		./configure   --lua-suffix=jit   --with-lua=/usr/local/openresty/luajit   --with-lua-include=/usr/local/openresty/luajit/include/luajit-2.1 && \
		make build && \
		make install
