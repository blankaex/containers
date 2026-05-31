run:
	docker run \
		--publish ${OLLAMA_PORT}:11434 \
		--volume ${PWD}/ollama:/root/.ollama \
		--gpus all \
		--restart unless-stopped \
		--name ollama \
		--detach \
		ollama/ollama

stop:
	docker stop ollama

restart:
	docker restart ollama

sh:
	docker exec -it ollama sh

logs:
	docker logs -f ollama

clean:
	docker rm -f ollama

pull:
	docker pull ollama/ollama

upgrade: pull stop clean run
