run:
	docker run \
		--publish ${PORTRACKER_PORT}:4999 \
		--volume /var/local/portracker/data:/data \
		--volume /var/run/docker.sock:/var/run/docker.sock:ro \
		--pid host \
		--cap-add SYS_PTRACE \
		--cap-add SYS_ADMIN \
		--security-opt apparmor=unconfined \
		--restart unless-stopped \
		--name portracker \
		--detach \
		mostafawahied/portracker:latest

stop:
	docker stop portracker


restart:
	docker restart portracker
