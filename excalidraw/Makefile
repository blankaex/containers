CONTAINER := exaclidraw
IMAGE := excalidraw/excalidraw:latest

run:
	docker run \
		--publish $(EXCALIDRAW_PORT):80 \
		--restart unless-stopped \
		--name $(CONTAINER) \
		--detach \
		$(IMAGE)

stop:
	docker stop $(CONTAINER) 

clean:
	docker rm -f $(CONTAINER)

pull:
	docker pull $(IMAGE)

upgrade: pull stop clean run
