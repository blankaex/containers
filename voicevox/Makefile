CONTAINER := voicevox
IMAGE := voicevox/voicevox_engine:cpu-latest

run:
	docker run \
		--publish $(VOICEVOX_PORT):50021 \
		--volume $(PWD)/data:/data \
		--env VV_PRESET_FILE=/data/presets.yaml \
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
