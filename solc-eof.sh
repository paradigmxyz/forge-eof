#!/bin/bash

/usr/local/bin/solc --via-ir --experimental-eof-version --optimize --ir-optimized "$@"
