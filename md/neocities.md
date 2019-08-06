@linux
@hosting

Push website  on neocoties

Install ruby and neocites

    sudo apt-get install ruby-full
    sudo gem install neocities


push site 

    neocities push site_repo/

Automatic push when pushing git repo

    printf '#!/bin/sh\nneocities push site_repo' >.git/hooks/pre-push && \
    chmod u+x .git/hooks/pre-push
