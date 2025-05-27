setup:
	@docker build --progress=plain -f Containerfile -t kcachegrind .

destroy:
	-@docker rm -fv kcachegrind

up: HTTP_PORT = "80"
up:
	@docker run --rm -d --name kcachegrind \
		-p 127.0.0.1:$(HTTP_PORT):80 \
		kcachegrind
	@docker logs -f kcachegrind

down:
	-@docker stop kchachegrind

shell:
	@docker exec -it kcachegrind /bin/sh

test:
	@$(CURDIR)/tests/index.sh
