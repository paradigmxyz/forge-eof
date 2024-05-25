#!/bin/bash

echo "$@" >> /app/foundry/logs/solc-legacy-args.log

exec /usr/local/bin/solc "$@" 2>> /app/foundry/logs/solc-legacy-error.log
