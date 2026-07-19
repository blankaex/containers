CONTAINER := qbittorrent
IMAGE := qbittorrent

build: Dockerfile
	docker build \
		--build-arg UID=$$(id -u) \
		--build-arg GID=$$(id -g) \
		--build-arg USER=$$(whoami) \
		--build-arg QBITTORRENT_PORT=$(QBITTORRENT_PORT) \
		--tag $(CONTAINER) .

rebuild: Dockerfile
	docker pull archlinux
	docker build \
		--build-arg UID=$$(id -u) \
		--build-arg GID=$$(id -g) \
		--build-arg USER=$$(whoami) \
		--build-arg QBITTORRENT_PORT=$(QBITTORRENT_PORT) \
		--no-cache \
		--tag $(CONTAINER) .

run:
	docker run \
		--user $$(id -u):$$(id -g) \
		--publish $(QBITTORRENT_PORT):$(QBITTORRENT_PORT) \
		--volume $(PWD)/qBittorrent:/config/qBittorrent \
		--volume $(HOME)/storage/torrents:$(HOME)/storage/torrents \
		--volume $(HOME)/anime:$(HOME)/anime \
		--restart unless-stopped \
		--name $(CONTAINER) \
		--detach \
		$(IMAGE)

stop:
	docker stop $(CONTAINER)

clean:
	docker rm -f $(CONTAINER)

upgrade: rebuild stop clean run
