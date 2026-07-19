CONTAINER_DB := szurubooru-database
CONTAINER_SERVER := szurubooru-server
CONTAINER_CLIENT := szurubooru-client
IMAGE_DB := postgres:11-alpine
IMAGE_SERVER := szurubooru/server
IMAGE_CLIENT := szurubooru/client
NETWORK := szurubooru

run-database:
	docker run \
		--env POSTGRES_USER=$(SZURUBOORU_USER) \
		--env POSTGRES_PASSWORD=$(SZURUBOORU_PASS) \
		--volume $(PWD)/sql:/var/lib/postgresql/data \
		--restart unless-stopped \
		--network $(NETWORK) \
		--name $(CONTAINER_DB) \
		--detach \
		$(IMAGE_DB)

run-server:
	docker run \
		--env POSTGRES_HOST=$(CONTAINER_DB) \
		--env POSTGRES_USER=$(SZURUBOORU_USER) \
		--env POSTGRES_PASSWORD=$(SZURUBOORU_PASS) \
		--env THREADS=4 \
	    --volume $(PWD)/data:/data \
	    --volume $(PWD)/szurubooru/server/config.yaml:/opt/app/config.yaml \
		--restart unless-stopped \
		--network $(NETWORK) \
		--name $(CONTAINER_SERVER) \
		--detach \
		$(IMAGE_SERVER)

run-client:
	docker run \
		--env BACKEND_HOST=$(CONTAINER_SERVER) \
		--env BASE_URL=/ \
		--publish $(SZURUBOORU_PORT):80 \
		--volume $(PWD)/data:/data:ro \
		--restart unless-stopped \
		--network $(NETWORK) \
		--name $(CONTAINER_CLIENT) \
		--detach \
		$(IMAGE_CLIENT)

run: run-database run-server run-client

stop:
	docker stop $(CONTAINER_DB) $(CONTAINER_SERVER) $(CONTAINER_CLIENT)

clean:
	docker rm -f $(CONTAINER_DB) $(CONTAINER_SERVER) $(CONTAINER_CLIENT)

pull:
	docker pull $(IMAGE_DB)
	docker pull $(IMAGE_SERVER)
	docker pull $(IMAGE_CLIENT)

upgrade: pull stop clean run
