@bash
@snip

# How to do a search and replace over multiple files

You could also use find and sed, but I find that this little line of perl works nicely.

	perl -pi -w -e 's/search/replace/g;' *.php

		-e means execute the following line of code.
		-i means edit in-place
		-w write warnings
		-p loop
