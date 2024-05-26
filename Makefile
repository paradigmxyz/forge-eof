#IMAGE:=forge-eof
IMAGE:=ghcr.io/fgimenez/forge-eof@sha256:f50b9cf0c19dfd894b56a8fe24482ad065c7ede9f1eb7c2c08c43fe87d98a075
BUILD_COMMAND:="forge build --force"
TEST_COMMAND:="forge test --gas-report --force -vvvv"

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
