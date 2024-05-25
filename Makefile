.PHONY: build
build:
	docker run --rm \
		-v $$(pwd):/app/foundry \
		-u $$(id -u):$$(id -g) \
		ghcr.io/fgimenez/forge-eof@sha256:2bf665873f733e59732c706f51c0df419242ab9080b5325b6dff051a82409fc7 \
		--foundry-directory /app/foundry \
		--foundry-command "forge build"

.PHONY: test
test:
	docker run --rm \
		-v $$(pwd):/app/foundry \
		-u $$(id -u):$$(id -g) \
		ghcr.io/fgimenez/forge-eof@sha256:2bf665873f733e59732c706f51c0df419242ab9080b5325b6dff051a82409fc7 \
		--foundry-directory /app/foundry \
		--foundry-command "forge test --gas-report -vvvvv"
