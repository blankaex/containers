run:
	docker run \
		--publish ${BENTOPDF_PORT}:8080 \
		--restart unless-stopped \
		--name bentopdf \
		--detach \
		bentopdf/bentopdf:latest

stop:
	docker stop bentopdf 

restart:
	docker restart bentopdf

sh:
	docker exec -it bentopdf sh
