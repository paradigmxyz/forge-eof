.PHONY: build
build:
	docker run --rm \
		-v $$(pwd):/app/foundry \
		-u $$(id -u):$$(id -g) \
		ghcr.io/fgimenez/forge-eof:latest \
		--foundry-directory /app/foundry \
		--foundry-command build

.PHONY: test
test:
	docker run --rm \
		-v $$(pwd):/app/foundry \
		-u $$(id -u):$$(id -g) \
		ghcr.io/fgimenez/forge-eof:latest \
		--foundry-directory /app/foundry \
		--foundry-command "test -vvv"
