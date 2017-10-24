.PHONY: build

build:
	docker build -t vikings/xware .

release: build
	docker push vikings/xware 
