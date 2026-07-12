run:
	docker run \
		--publish ${EXCALIDRAW_PORT}:80 \
		--restart unless-stopped \
		--name excalidraw \
		--detach \
		excalidraw/excalidraw:latest

stop:
	docker stop excalidraw 

restart:
	docker restart excalidraw

sh:
	docker exec -it excalidraw sh

clean:
	docker rm -f excalidraw

pull:
	docker pull excalidrawteam/excalidraw:latest

upgrade: pull stop clean run
