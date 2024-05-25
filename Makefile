.PHONY: build-eof
build-eof:
	docker run --rm \
		-v $$(pwd):/app/foundry \
		-u $$(id -u):$$(id -g) \
		ghcr.io/fgimenez/forge-eof@sha256:2bf665873f733e59732c706f51c0df419242ab9080b5325b6dff051a82409fc7 \
		--foundry-directory /app/foundry \
		--foundry-command "forge build"

.PHONY: test-eof
test-eof:
	docker run --rm \
		-v $$(pwd):/app/foundry \
		-u $$(id -u):$$(id -g) \
		ghcr.io/fgimenez/forge-eof@sha256:2bf665873f733e59732c706f51c0df419242ab9080b5325b6dff051a82409fc7 \
		--foundry-directory /app/foundry \
		--foundry-command "forge test --optimize --gas-report -vvvvv"

.PHONY: build-legacy
build-legacy:
	forge build

.PHONY: test-legacy
test-legacy:
	forge test --use 0.8.26 --optimize --gas-report -vvvvv
