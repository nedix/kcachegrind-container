setup:
	@docker build . -t kcachegrind

up: PORT = 1234
up:
	@docker run --rm -p $(PORT):8080 --name kcachegrind \
		kcachegrind
