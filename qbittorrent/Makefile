build: Dockerfile
	docker build \
		--build-arg QBITTORRENT_PORT=${QBITTORRENT_PORT} \
		--tag qbittorrent .

rebuild: Dockerfile
	docker pull archlinux
	docker build \
		--build-arg QBITTORRENT_PORT=${QBITTORRENT_PORT} \
		--no-cache \
		--tag qbittorrent .

run:
	docker run \
		--user 1000:1000 \
		--publish ${QBITTORRENT_PORT}:${QBITTORRENT_PORT} \
		--volume ${PWD}/qBittorrent:/config/qBittorrent \
		--volume /home/blankaex/storage/torrents:/home/blankaex/storage/torrents \
		--volume /home/blankaex/anime:/home/blankaex/anime \
		--restart unless-stopped \
		--name qbittorrent \
		--detach \
		qbittorrent

stop:
	docker stop qbittorrent

restart:
	docker restart qbittorrent

sh:
	docker exec -it qbittorrent sh

clean:
	docker rm -f qbittorrent

check:
	docker exec qbittorrent ls /home/blankaex/anime

upgrade: rebuild stop clean run
