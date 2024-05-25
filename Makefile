#IMAGE:=forge-eof
IMAGE:=ghcr.io/fgimenez/forge-eof@sha256:8919dbd4e9a9d59b8e99ab36692a8ba0070e6d12cc3b7763b4d854a579abc545
BUILD_COMMAND:="forge build --force"
TEST_COMMAND:="forge test --gas-report --force"

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
