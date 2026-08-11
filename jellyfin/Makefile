CONTAINER := jellyfin
IMAGE := jellyfin/jellyfin

run:
	docker run \
		--publish $(JELLYFIN_TCP):8096/tcp \
		--publish $(JELLYFIN_UDP):7359/udp \
		--volume $(PWD)/jellyfin-config:/config \
		--volume $(PWD)/jellyfin-cache:/cache \
		--mount type=bind,source=/mnt/storage/anime,target=/anime \
		--mount type=bind,source=/mnt/storage/dramas,target=/dramas \
		--mount type=bind,source=/mnt/storage/movies,target=/movies \
		--mount type=bind,source=/mnt/storage/tv,target=/tv \
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
