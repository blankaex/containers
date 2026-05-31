run: 
	docker run \
		--publish ${UPTIME_KUMA_PORT}:3001 \
		--volume ${PWD}/uptime-kuma:/app/data \
		--name uptime-kuma \
		--restart unless-stopped \
		--detach \
		louislam/uptime-kuma:2

stop:
	docker stop uptime-kuma

restart:
	docker restart uptime-kuma

sh:
	docker exec -it uptime-kuma sh

clean:
	docker rm -f uptime-kuma

pull:
	docker pull louislam/uptime-kuma:2

upgrade: pull stop clean run
