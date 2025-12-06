build: build-server build-client

run: run-database run-server run-client

stop: stop-database stop-server stop-client

restart: restart-database restart-server restart-client

build-server:
	docker pull szurubooru/server && \
		docker tag szurubooru/server szurubooru-server

build-client:
	docker pull szurubooru/client && \
		docker tag szurubooru/client szurubooru-client

run-database:
	docker run \
		--env POSTGRES_USER=${SZURUBOORU_USER} \
		--env POSTGRES_PASSWORD=${SZURUBOORU_PASS} \
		--volume /var/local/szurubooru/sql:/var/lib/postgresql/data \
		--restart unless-stopped \
		--network szurubooru \
		--name szurubooru-database \
		--detach \
		postgres:11-alpine

run-server:
	docker run \
		--env POSTGRES_HOST=szurubooru-database \
		--env POSTGRES_USER=${SZURUBOORU_USER} \
		--env POSTGRES_PASSWORD=${SZURUBOORU_PASS} \
		--env THREADS=4 \
	    --volume /var/local/szurubooru/data:/data \
	    --volume ${PWD}/szurubooru/server/config.yaml:/opt/app/config.yaml \
		--restart unless-stopped \
		--network szurubooru \
		--name szurubooru-server \
		--detach \
		szurubooru-server

run-client:
	docker run \
		--env BACKEND_HOST=szurubooru-server \
		--env BASE_URL=/ \
		--publish ${SZURUBOORU_PORT}:80 \
		--volume /var/local/szurubooru/data:/data:ro \
		--restart unless-stopped \
		--network szurubooru \
		--name szurubooru-client \
		--detach \
		szurubooru-client

stop-database:
	docker stop szurubooru-database

stop-server:
	docker stop szurubooru-server

stop-client:
	docker stop szurubooru-client

restart-database:
	docker restart szurubooru-database

restart-server:
	docker restart szurubooru-server

restart-client:
	docker restart szurubooru-client
