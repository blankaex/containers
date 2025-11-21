build: Dockerfile
	docker build \
		--build-arg MINISERVE_PORT=${MINISERVE_PORT} \
		--tag miniserve .

run:
	docker run \
		--publish ${MINISERVE_PORT}:${MINISERVE_PORT} \
		--volume /home/blankaex/containers/miniserve/miniserve:/etc/miniserve \
		--volume /home/blankaex/miniserve:/var/local/miniserve \
		--restart unless-stopped \
		--name miniserve \
		--detach \
		miniserve

stop:
	docker stop miniserve

restart:
	docker restart miniserve

sh:
	docker exec -it miniserve sh
