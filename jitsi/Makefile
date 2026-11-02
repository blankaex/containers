CONFIG_DIR = $(PWD)/jitsi
ENV_FILE = $(CONFIG_DIR)/env
NETWORK = jitsi

CONTAINER_WEB = jitsi-web
CONTAINER_PROSODY = jitsi-prosody
CONTAINER_JICOFO = jitsi-jicofo
CONTAINER_JVB = jitsi-jvb

IMAGE_WEB = ghcr.io/jitsi/web:stable
IMAGE_PROSODY = ghcr.io/jitsi/prosody:stable
IMAGE_JICOFO = ghcr.io/jitsi/jicofo:stable
IMAGE_JVB = ghcr.io/jitsi/jvb:stable

run-prosody:
	docker run \
		--env-file $(ENV_FILE) \
		--volume $(CONFIG_DIR)/prosody/config:/config \
		--volume $(CONFIG_DIR)/prosody/prosody-plugins-custom:/prosody-plugins-custom \
		--volume $(CONFIG_DIR)/prosody/custom-ca:/usr/local/share/ca-certificates:ro \
		--volume $(CONFIG_DIR)/storage/prosody:/var/lib/prosody \
		--read-only \
		--tmpfs /run:size=16M,mode=1750,exec \
		--tmpfs /tmp:size=16M,mode=1777,noexec \
		--restart unless-stopped \
		--network $(NETWORK) \
		--name $(CONTAINER_PROSODY) \
		--network-alias xmpp.meet.jitsi \
		--expose 5222 \
		--expose 5269 \
		--expose 5347 \
		--expose 5280 \
		--detach \
		$(IMAGE_PROSODY)

run-jicofo:
	docker run \
		--env-file $(ENV_FILE) \
		--volume $(CONFIG_DIR)/jicofo:/config \
		--volume $(CONFIG_DIR)/jicofo/custom-ca:/usr/local/share/ca-certificates:ro \
		--read-only \
		--tmpfs /run:size=32M,mode=1750,exec \
		--tmpfs /tmp:size=16M,mode=1777,noexec \
		--restart unless-stopped \
		--network $(NETWORK) \
		--name $(CONTAINER_JICOFO) \
		--publish 127.0.0.1:$(JITSI_JICOFO_REST_PORT):8888 \
		--detach \
		$(IMAGE_JICOFO)

run-jvb:
	docker run \
		--env-file $(ENV_FILE) \
		--volume $(CONFIG_DIR)/jvb:/config \
		--volume $(CONFIG_DIR)/jvb/custom-ca:/usr/local/share/ca-certificates:ro \
		--read-only \
		--tmpfs /run:size=32M,mode=1750,exec \
		--tmpfs /tmp:size=16M,mode=1777,noexec \
		--restart unless-stopped \
		--network $(NETWORK) \
		--name $(CONTAINER_JVB) \
		--publish $(JITSI_JVB_UDP_PORT):10000/udp \
		--publish 127.0.0.1:$(JITSI_JVB_COLIBRI_PORT):8080 \
		--detach \
		$(IMAGE_JVB)

run-web:
	docker run \
		--env-file $(ENV_FILE) \
		--volume $(CONFIG_DIR)/web:/config \
		--volume $(CONFIG_DIR)/web/custom-ca:/usr/local/share/ca-certificates:ro \
		--volume $(CONFIG_DIR)/storage/web:/storage \
		--volume $(CONFIG_DIR)/storage/transcripts:/usr/share/jitsi-meet/transcripts:ro \
		--volume $(CONFIG_DIR)/tmp/web-load-test:/usr/share/jitsi-meet/load-test \
		--read-only \
		--tmpfs /run:size=16M,mode=1750,exec \
		--tmpfs /tmp:size=16M,mode=1777,noexec \
		--restart unless-stopped \
		--network $(NETWORK) \
		--name $(CONTAINER_WEB) \
		--publish $(JITSI_WEB_HTTP_PORT):8000 \
		--publish $(JITSI_WEB_HTTPS_PORT):8443 \
		--detach \
		$(IMAGE_WEB)

run: run-prosody run-jicofo run-jvb run-web

stop:
	docker stop $(CONTAINER_WEB) $(CONTAINER_JVB) $(CONTAINER_JICOFO) $(CONTAINER_PROSODY)

clean:
	docker rm -f $(CONTAINER_WEB) $(CONTAINER_JVB) $(CONTAINER_JICOFO) $(CONTAINER_PROSODY)

pull:
	docker pull $(IMAGE_PROSODY)
	docker pull $(IMAGE_JICOFO)
	docker pull $(IMAGE_JVB)
	docker pull $(IMAGE_WEB)

upgrade: pull stop clean run
