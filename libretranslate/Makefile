run:
	docker run \
		--user $(id -u):$(id -g) \
		--publish ${LIBRETRANSLATE_PORT}:5000 \
		--volume ${PWD}/libretranslate/lt-db:/app/db \
		--volume ${PWD}/libretranslate/lt-local:/home/libretranslate/.local \
		--restart unless-stopped \
		--name libretranslate \
		--detach \
		libretranslate/libretranslate --load-only en,ja,zt,zh

stop:
	docker stop libretranslate 

restart:
	docker restart libretranslate

sh:
	docker exec -it libretranslate sh

clean:
	docker container prune -f
