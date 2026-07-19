CONTAINER := bentopdf
IMAGE := bentopdfteam/bentopdf:latest

run:
	docker run \
		--publish $(BENTOPDF_PORT):8080 \
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
