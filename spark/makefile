.PHONY: build

build:
	docker build -t vikings/spark .

release: build
	docker push vikings/spark
