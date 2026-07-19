CONTAINER := jellyfin
IMAGE := jellyfin/jellyfin

run:
	docker run \
		--publish $(JELLYFIN_TCP):8096/tcp \
		--publish $(JELLYFIN_UDP):7359/udp \
		--volume $(PWD)/jellyfin-config:/config \
		--volume $(PWD)/jellyfin-cache:/cache \
		--mount type=bind,source=$(HOME)/anime,target=/anime \
		--mount type=bind,source=$(HOME)/storage/videos,target=/videos \
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
