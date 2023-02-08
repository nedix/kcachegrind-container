setup:
	@docker build . -t kcachegrind

up: detach =
up:
	@docker run --rm $(if $(detach),-d,) -p 1234:8080 --name kcachegrind \
		kcachegrind
