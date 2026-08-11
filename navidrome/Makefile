CONTAINER := navidrome
IMAGE := deluan/navidrome:latest

run:
	docker run \
	  	--user $$(id -u):$$(id -g) \
		--publish $(NAVIDROME_PORT):4533 \
		--volume $(PWD)/navidrome:/data \
		--volume /mnt/storage/music:/music:ro \
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
