@devops
@hashi


Vagrant allows the create, manage, and provision virtual machines with the command lines. (it'salso the core wrapper of VirtualBox and work with VMware and other hypervisor.)
It is great to simulate a production environment for dev and testing stage.

When a `VagrantFile` is present, you can run

    vagrant up

It will automatically build the VMs environment according to the files description.
Some command

    vagrant status   # see the status of the VMs
    vagrant suspend  # suspend the VMs
    vagrant destroy  # destroy the VMs
    vagrant box list # (global command (*)) see the available box in vagrant
    vagrant global-status # (global command (*)) see the available box in vagrant
    vagrant ssh # connect to a vm

(\*) dont need to be in vagrant repo (i.e. where there is a Vagrant File)

## Utils

Copy a file a VM. (obtain the port with `vagrant port`)

    scp -P 2222 vagrant@127.0.0.1:/vagrant/some-file.txt .

Or more generaly

    vagrant upload local_file [detination] vm-name


work around apt error “repository no longer has a Release file”

    apt get update --allow-releaseinfo-change
