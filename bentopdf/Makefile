run:
	docker run \
		--publish ${BENTOPDF_PORT}:8080 \
		--restart unless-stopped \
		--name bentopdf \
		--detach \
		bentopdfteam/bentopdf:latest

stop:
	docker stop bentopdf 

restart:
	docker restart bentopdf

sh:
	docker exec -it bentopdf sh

clean:
	docker rm -f bentopdf

pull:
	docker pull bentopdfteam/bentopdf:latest

upgrade: pull stop clean run
