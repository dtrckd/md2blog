#!/bin/bash

# Show bangs
grep -R -m1 '^@' | cut -d':' -f 2 | sort -u
