setup:
	@docker build -f Containerfile -t kcachegrind .

up: PORT = 8080
up:
	@docker run --rm -p $(PORT):80 --name kcachegrind \
		kcachegrind
