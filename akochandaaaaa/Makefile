build: Dockerfile
	docker build \
		--tag akochandaaaaa .

run:
	docker run \
		--publish ${AKOCHAN_PORT}:80 \
		--restart unless-stopped \
		--name akochandaaaaa \
		--detach \
		akochandaaaaa

stop:
	docker stop akochandaaaaa

restart:
	docker restart akochandaaaaa

sh:
	docker exec -it akochandaaaaa sh

clean:
	docker container prune -f
