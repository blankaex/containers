build: Dockerfile
	docker build \
		--build-arg QBITTORRENT_PORT=${QBITTORRENT_PORT} \
		--tag qbittorrent .

run:
	docker run \
		--publish ${QBITTORRENT_PORT}:${QBITTORRENT_PORT} \
		--volume /home/blankaex/.config/qBittorrent:/home/blankaex/.config/qBittorrent \
		--volume /home/blankaex/storage/torrents:/home/blankaex/storage/torrents \
		--volume /home/blankaex/anime:/home/blankaex/anime \
		--restart unless-stopped \
		--detach \
		qbittorrent

stop:
	docker stop $$(docker ps | grep qbittorrent | cut -d' ' -f1)

restart:
	docker restart $$(docker ps | grep qbittorrent | cut -d' ' -f1)

sh:
	docker exec -it $$(docker ps | grep qbittorrent | cut -d' ' -f1) sh
