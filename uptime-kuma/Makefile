CONTAINER := uptime-kuma
IMAGE := louislam/uptime-kuma:2

run: 
	docker run \
		--publish $(UPTIME_KUMA_PORT):3001 \
		--volume $(PWD)/uptime-kuma:/app/data \
		--name $(CONTAINER) \
		--restart unless-stopped \
		--detach \
		$(IMAGE)

stop:
	docker stop $(CONTAINER)

clean:
	docker rm -f $(CONTAINER)

pull:
	docker pull $(IMAGE)

upgrade: pull stop clean run
