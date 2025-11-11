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
		--name syncplay \
		--detach \
		--rm \
		syncplay

stop:
	docker stop syncplay

restart:
	docker restart syncplay

sh:
	docker exec -it syncplay sh
