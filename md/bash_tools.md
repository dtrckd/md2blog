@bash
@recipes

# Compare two directory content
    diff -qNr .  /other/path/ | grep -vE "(\.git|\.pyc)"

# Copy file with the tree structure of the source file

    find /path/to/files -name '*.csv' | cpio -pdm /target

     

