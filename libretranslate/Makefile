CONTAINER := libretranslate
IMAGE := libretranslate/libretranslate

run:
	docker run \
		--publish $(LIBRETRANSLATE_PORT):5000 \
		--volume $(PWD)/libretranslate/lt-db:/app/db \
		--volume $(PWD)/libretranslate/lt-local:/home/libretranslate/.local \
		--restart unless-stopped \
		--name $(CONTAINER) \
		--detach \
		$(IMAGE) --load-only en,ja,zt,zh

stop:
	docker stop $(CONTAINER) 

clean:
	docker rm -f $(CONTAINER)

pull:
	docker pull $(IMAGE)

upgrade: pull stop clean run
