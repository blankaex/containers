run:
	docker run \
	  	--user $(id -u):$(id -g) \
		--publish ${NAVIDROME_PORT}:4533 \
		--volume ${PWD}/navidrome:/data \
		--volume /home/blankaex/storage/music:/music:ro \
		--restart unless-stopped \
		--name navidrome \
		--detach \
		deluan/navidrome:latest

stop:
	docker stop navidrome


restart:
	docker restart navidrome

clean:
	docker rm -f navidrome

pull:
	docker pull deluan/navidrome:latest

upgrade: pull stop clean run
