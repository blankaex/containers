run: 
	docker run -it \
		--env TZ=${TZ} \
		--volume ${PWD}/nginx:/etc/nginx \
		--volume ${PWD}/nginx-ui:/etc/nginx-ui \
		--volume ${PWD}/nginx-logs:/var/log/nginx \
		--volume ${PWD}/-var-www-html:/var/www/html \
		--volume /var/run/docker.sock:/var/run/docker.sock \
		--volume /etc/letsencrypt:/etc/letsencrypt \
		--restart unless-stopped \
		--network host \
		--name nginx-ui \
		--detach \
		uozi/nginx-ui:latest

stop:
	docker stop nginx-ui

restart:
	docker restart nginx-ui

sh:
	docker exec -it nginx-ui sh

clean:
	docker container prune -f
