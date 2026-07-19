CONTAINER := autotagger
IMAGE := ghcr.io/danbooru/autotagger

run:
	docker run \
		--publish $(AUTOTAGGER_PORT):5000 \
		--restart unless-stopped \
		--name $(CONTAINER) \
		--detach \
		$(IMAGE)

stop:
	docker stop $(CONTAINER)

clean:
	docker rm -f $(CONTAINER)

pull:
	docker pull $(IMAGE)

upgrade: pull stop clean run
