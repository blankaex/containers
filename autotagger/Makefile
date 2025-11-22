run:
	docker run \
		--publish ${AUTOTAGGER_PORT}:5000 \
		--restart unless-stopped \
		--name autotagger \
		--detach \
		ghcr.io/danbooru/autotagger

stop:
	docker stop autotagger

restart:
	docker restart autotagger

sh:
	docker exec -it autotagger sh
