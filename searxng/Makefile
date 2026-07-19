CONTAINER := searxng
IMAGE := searxng/searxng

run:
	docker run \
		--publish $(SEARXNG_PORT):8080 \
		--volume $(PWD)/searxng:/etc/searxng \
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
