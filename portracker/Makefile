CONTAINER := portracker
IMAGE := mostafawahied/portracker:latest

run:
	docker run \
		--publish $(PORTRACKER_PORT):4999 \
		--volume $(PWD)/portracker/data:/data \
		--volume /var/run/docker.sock:/var/run/docker.sock:ro \
		--pid host \
		--cap-add SYS_PTRACE \
		--cap-add SYS_ADMIN \
		--security-opt apparmor=unconfined \
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
