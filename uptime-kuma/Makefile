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
	docker container prune -f
