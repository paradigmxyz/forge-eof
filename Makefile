#IMAGE:=forge-eof
IMAGE:=ghcr.io/fgimenez/forge-eof@sha256:c146ad3da90dab17630685c31b0b2582a164915c4ad68c3f3ef46a2423f3ea69
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
