CONTAINER := gluetun
IMAGE := qmcgaw/gluetun:latest

run:
	docker run \
		--cap-add NET_ADMIN \
		--device /dev/net/tun:/dev/net/tun \
		--env-file "$(PWD)/gluetun/gluetun.env" \
		--publish $(GLUETUN_PORT):9999 \
		--publish $(QBITTORRENT_PORT):$(QBITTORRENT_PORT) \
		--volume "$(PWD)/gluetun:/gluetun:ro" \
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
