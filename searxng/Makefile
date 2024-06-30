build:
	docker pull searxng/searxng && \
		docker tag searxng/searxng searxng

run:
	docker run \
		--publish ${SEARXNG_PORT}:8080 \
		--volume "${PWD}/searxng:/etc/searxng" \
		--env "BASE_URL=${SEARXNG_URL}" \
		--env "INSTANCE_NAME=searxng" \
		--restart unless-stopped \
		--detach \
		searxng

stop:
	docker stop $$(docker ps | grep searxng | cut -d' ' -f1)

sh:
	docker exec -it $$(docker ps | grep searxng | cut -d' ' -f1) sh
