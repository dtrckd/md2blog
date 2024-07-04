@bash
@recipes


replace the first line of all matching files.
Here we edit the shabang inline in all python scripts.

    find -type f -name "*.py" -exec grep -l '^#!/bin/python' {} \; -exec sed -i '1s|^#!/bin/python|#!/usr/bin/env python|' {} \;
