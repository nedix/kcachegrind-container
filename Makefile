setup:
	@docker build --progress=plain -f Containerfile -t kcachegrind .

up: PORT = 8080
up:
	@docker run --rm -p $(PORT):8080 --name kcachegrind \
		kcachegrind
