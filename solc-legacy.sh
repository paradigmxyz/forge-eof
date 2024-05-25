#!/bin/bash

echo "$@" >> /app/foundry/solc-legacy-args.log

exec /usr/local/bin/solc --via-ir --optimize --ir-optimized "$@" 2>> /app/foundry/solc-legacy-error.log
