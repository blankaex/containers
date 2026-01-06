run:
	docker run \
		--user $(id -u):$(id -g) \
		--publish ${JELLYFIN_TCP}:8096/tcp \
		--publish ${JELLYFIN_UDP}:7359/udp \
		--volume ${PWD}/jellyfin-config:/config \
		--volume ${PWD}/jellyfin-cache:/cache \
		--mount type=bind,source=${HOME}/anime,target=/anime \
		--mount type=bind,source=${HOME}/storage/videos,target=/videos \
		--restart unless-stopped \
		--name jellyfin \
		--detach \
		jellyfin/jellyfin

stop:
	docker stop jellyfin 

restart:
	docker restart jellyfin

sh:
	docker exec -it jellyfin sh

clean:
	docker container prune -f
