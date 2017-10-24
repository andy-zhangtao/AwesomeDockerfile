.PHONY: build

build:
	docker build -t vikings/youtube-server --no-cache .

release: build
	docker push vikings/youtube-server 
