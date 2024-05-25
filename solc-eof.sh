#!/bin/bash

echo "$@" >> /app/foundry/solc-eof-args.log

exec /usr/local/bin/solc --via-ir --experimental-eof-version --optimize --ir-optimized "$@" 2>> /app/foundry/solc-eof-error.log
