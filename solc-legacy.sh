#!/bin/bash

/usr/local/bin/solc --via-ir --optimize --ir-optimized "$@"
