DOCKER_IMAGE_NAME := jekyll-image
DOCKER_CONTAINER_NAME := jekyll-container
DOCKER_RUN_CMD := docker run -v "$(shell pwd)":/app $(DOCKER_IMAGE_NAME)

.PHONY: build run clean

build: Dockerfile
	docker build -t $(DOCKER_IMAGE_NAME) .

# Saves site to be copied into www to ./site.tar.gz
site: build
	docker run -v "./":"/output" $(DOCKER_IMAGE_NAME)

clean:
	-docker rm -f $(DOCKER_CONTAINER_NAME)
	-docker rmi $(DOCKER_IMAGE_NAME)
