CONTAINER := nginx-ui
IMAGE := uozi/nginx-ui:latest

run: 
	docker run -it \
		--env TZ=$(TZ) \
		--volume $(PWD)/nginx:/etc/nginx \
		--volume $(PWD)/nginx-ui:/etc/nginx-ui \
		--volume $(PWD)/nginx-logs:/var/log/nginx \
		--volume $(PWD)/var/www:/var/www \
		--volume /var/run/docker.sock:/var/run/docker.sock \
		--volume /etc/letsencrypt:/etc/letsencrypt \
		--restart unless-stopped \
		--network host \
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
