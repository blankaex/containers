run: 
	docker run \
		--publish ${STATPING_PORT}:8080 \
		--volume /home/blankaex/containers/statping/statping:/app \
		--name statping \
		--restart unless-stopped \
		--detach \
		adamboutcher/statping-ng

stop:
	docker stop statping

restart:
	docker restart statping
