#!/bin/bash

if [ -z "$1" ]; then
    BANG=""
else
    BANG="$1"
fi

# Show bangs
grep -R -m1 "^@${BANG}" | cut -d':' -f 2 | sort -u
