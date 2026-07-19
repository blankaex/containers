CONTAINER := miniserve
IMAGE := miniserve

build: Dockerfile
	docker build \
		--build-arg MINISERVE_PORT=$(MINISERVE_PORT) \
		--tag $(CONTAINER) .

rebuild: Dockerfile
	docker pull archlinux
	docker build \
		--build-arg MINISERVE_PORT=$(MINISERVE_PORT) \
		--no-cache \
		--tag $(CONTAINER) .

run:
	docker run \
		--publish $(MINISERVE_PORT):$(MINISERVE_PORT) \
		--volume $(PWD)/miniserve:/etc/miniserve \
		--volume $(HOME)/miniserve:/var/local/miniserve \
		--restart unless-stopped \
		--name $(CONTAINER) \
		--detach \
		$(IMAGE)

stop:
	docker stop $(CONTAINER)

clean:
	docker rm -f $(CONTAINER)

upgrade: rebuild stop clean run
