run: 
	docker run \
		--publish 2155:8080 \
		--volume /home/blankaex/containers/statping/statping/app:/app \
		--name statping \
		--restart unless-stopped \
		--detach \
		adamboutcher/statping-ng

stop:
	docker stop statping

restart:
	docker restart statping
