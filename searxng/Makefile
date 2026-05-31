run:
	docker run \
		--publish ${SEARXNG_PORT}:8080 \
		--volume ${PWD}/searxng:/etc/searxng \
		--env "BASE_URL=${SEARXNG_URL}" \
		--env "INSTANCE_NAME=searxng" \
		--restart unless-stopped \
		--name searxng \
		--detach \
		searxng/searxng

stop:
	docker stop searxng

restart:
	docker restart searxng

sh:
	docker exec -it searxng sh

clean:
	docker rm -f searxng

pull:
	docker pull searxng/searxng

upgrade: pull stop clean run
