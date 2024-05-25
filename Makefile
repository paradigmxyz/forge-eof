IMAGE:=forge-eof
# IMAGE:=ghcr.io/fgimenez/forge-eof@sha256:d687bfec3ef72c4a42de6b706b44a6dd582933493754c3ce43ca1d5d3de4c29d
BUILD_COMMAND:="forge build --force"
TEST_COMMAND:="forge test --gas-report -vvvvv --force"


.PHONY: build-eof
build-eof:
	docker run --rm \
		-v $$(pwd):/app/foundry \
		-u $$(id -u):$$(id -g) \
		$(IMAGE) \
		--enable-eof \
		--foundry-directory /app/foundry \
		--foundry-command $(BUILD_COMMAND)

.PHONY: test-eof
test-eof:
	docker run --rm \
		-v $$(pwd):/app/foundry \
		-u $$(id -u):$$(id -g) \
		$(IMAGE) \
		--enable-eof \
		--foundry-directory /app/foundry \
		--foundry-command $(TEST_COMMAND)

.PHONY: build-legacy
build-legacy:
	docker run --rm \
		-v $$(pwd):/app/foundry \
		-u $$(id -u):$$(id -g) \
		$(IMAGE) \
		--foundry-directory /app/foundry \
		--foundry-command $(BUILD_COMMAND)

.PHONY: test-legacy
test-legacy:
	docker run --rm \
		-v $$(pwd):/app/foundry \
		-u $$(id -u):$$(id -g) \
		$(IMAGE) \
		--foundry-directory /app/foundry \
		--foundry-command $(TEST_COMMAND)
