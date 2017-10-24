.PHONY: build

build:
	docker build -t vikings/openresty:1.11.2.3-dev .

release: build
	docker push vikings/openresty:1.11.2.3-dev 
