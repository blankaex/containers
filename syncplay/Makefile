build: Dockerfile
	docker build \
		--build-arg SYNCPLAY_PASSWORD=${SYNCPLAY_PASSWORD} \
		--build-arg SYNCPLAY_PORT=${SYNCPLAY_PORT} \
		--build-arg SYNCPLAY_SALT=${SYNCPLAY_SALT} \
		--tag syncplay .

run:
	docker run \
		--publish ${SYNCPLAY_PORT}:${SYNCPLAY_PORT} \
		--volume /etc/letsencrypt/:/etc/letsencrypt/:ro \
		--restart unless-stopped \
		--detach \
		syncplay

stop:
	docker stop $$(docker ps | grep syncplay | cut -d' ' -f1)

restart:
	docker restart $$(docker ps | grep syncplay | cut -d' ' -f1)

sh:
	docker exec -it $$(docker ps | grep syncplay | cut -d' ' -f1) sh
