#!/bin/bash

echo "$@" >> /app/foundry/logs/solc-eof-args.log

exec /usr/local/bin/solc --experimental-eof-version "$@" 2>> /app/foundry/logs/solc-eof-error.log
