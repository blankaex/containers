CONTAINER := blocky
IMAGE := ghcr.io/0xerr0r/blocky:latest

run:
	docker run \
		--env TZ=$(TZ) \
		--publish $(BLOCKY_ADDRESS):53/tcp \
		--publish $(BLOCKY_ADDRESS):53/udp \
		--volume $(PWD)/blocky/config.yml:/app/config.yml:ro \
		--restart unless-stopped \
		--network monitor \
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
