build: Dockerfile
	docker build \
		--build-arg QBITTORRENT_PORT=${QBITTORRENT_PORT} \
		--build-arg BITTORRENT_PORT=${BITTORRENT_PORT} \
		--tag qbittorrent .

run:
	docker run \
		--publish ${QBITTORRENT_PORT}:${QBITTORRENT_PORT} \
		--publish ${BITTORRENT_PORT}:${BITTORRENT_PORT} \
		--volume /home/blankaex/.config/qBittorrent:/home/blankaex/.config/qBittorrent \
		--volume /home/blankaex/storage/torrents:/home/blankaex/storage/torrents \
		--volume /home/blankaex/anime:/home/blankaex/anime \
		--restart unless-stopped \
		--detach \
		qbittorrent

stop:
	docker stop $$(docker ps | grep qbittorrent | cut -d' ' -f1)

sh:
	docker exec -it $$(docker ps | grep qbittorrent | cut -d' ' -f1) sh
