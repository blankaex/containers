CONTAINER := syncplay
IMAGE := syncplay

build: Dockerfile
	docker build \
		--build-arg SYNCPLAY_PASSWORD=$(SYNCPLAY_PASSWORD) \
		--build-arg SYNCPLAY_PORT=$(SYNCPLAY_PORT) \
		--build-arg SYNCPLAY_SALT=$(SYNCPLAY_SALT) \
		--tag $(CONTAINER) .

rebuild: Dockerfile
	docker pull archlinux
	docker build \
		--build-arg SYNCPLAY_PASSWORD=$(SYNCPLAY_PASSWORD) \
		--build-arg SYNCPLAY_PORT=$(SYNCPLAY_PORT) \
		--build-arg SYNCPLAY_SALT=$(SYNCPLAY_SALT) \
		--no-cache \
		--tag $(CONTAINER) .

run:
	docker run \
		--publish $(SYNCPLAY_PORT):$(SYNCPLAY_PORT) \
		--volume /etc/letsencrypt/:/etc/letsencrypt/:ro \
		--restart unless-stopped \
		--name $(CONTAINER) \
		--detach \
		$(IMAGE)

stop:
	docker stop $(CONTAINER)

clean:
	docker rm -f $(CONTAINER)

upgrade: rebuild stop clean run
