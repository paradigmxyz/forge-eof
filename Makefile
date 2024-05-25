IMAGE:=forge-eof
# IMAGE:=ghcr.io/fgimenez/forge-eof@sha256:d687bfec3ef72c4a42de6b706b44a6dd582933493754c3ce43ca1d5d3de4c29d

.PHONY: build-eof
build-eof:
	docker run --rm \
		-v $$(pwd):/app/foundry \
		-u $$(id -u):$$(id -g) \
		$(IMAGE) \
		--enable-eof \
		--foundry-directory /app/foundry \
		--foundry-command "forge build"

.PHONY: test-eof
test-eof:
	docker run --rm \
		-v $$(pwd):/app/foundry \
		-u $$(id -u):$$(id -g) \
		$(IMAGE) \
		--enable-eof \
		--foundry-directory /app/foundry \
		--foundry-command "forge test --gas-report -vvvvv"

.PHONY: build-legacy
build-legacy:
	docker run --rm \
		-v $$(pwd):/app/foundry \
		-u $$(id -u):$$(id -g) \
		$(IMAGE) \
		--foundry-directory /app/foundry \
		--foundry-command "forge build"

.PHONY: test-legacy
test-legacy:
	docker run --rm \
		-v $$(pwd):/app/foundry \
		-u $$(id -u):$$(id -g) \
		$(IMAGE) \
		--foundry-directory /app/foundry \
		--foundry-command "forge test --gas-report -vvvvv"
