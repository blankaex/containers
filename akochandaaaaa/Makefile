CONTAINER := akochandaaaaa

build: Dockerfile
	docker build \
		--tag $(CONTAINER) .

rebuild: Dockerfile
	docker build \
		--no-cache \
		--tag $(CONTAINER) .

run:
	docker run \
		--publish $(AKOCHAN_PORT):80 \
		--restart unless-stopped \
		--name $(CONTAINER) \
		--detach \
		$(CONTAINER)

stop:
	docker stop $(CONTAINER)

clean:
	docker rm -f $(CONTAINER)

upgrade: rebuild stop clean run
