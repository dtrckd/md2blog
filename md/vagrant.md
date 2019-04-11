@linux
@hashi

Copy a file a VM. (obtain the port with `vagrant port`)

    scp -P 2222 vagrant@127.0.0.1:/vagrant/some-file.txt .

Or more generaly
    vagrant upload local_file
