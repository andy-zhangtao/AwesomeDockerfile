.PHONY: build

build:
	docker build -t vikings/kafka:0.10.2.0 .

release: build
	docker push vikings/kafka:0.10.2.0 
