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
		--name qbittorrent \
		--detach \
		--rm \
		qbittorrent

stop:
	docker stop qbittorrent

restart:
	docker restart qbittorrent

sh:
	docker exec -it qbittorrent sh

check:
	docker exec qbittorrent ls /home/blankaex/anime
