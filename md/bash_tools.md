@bash
@recipe

# Copy file with the tree structure of the source file

    find /path/to/files -name '*.csv' | cpio -pdm /target

# Create tar.gz archive
     tar czvf <nom_archive>.tar.gz <nom_rep>
