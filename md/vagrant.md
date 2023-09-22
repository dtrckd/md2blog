@devops
@hashi


Vagrant allows the create, manage, and provision virtual machines with the command lines. (it'salso the core wrapper of VirtualBox and work with VMware and other hypervisor.)
It is great to simulate a production environment for dev and testing stage.

When a `VagrantFile` is present, you can run

    vagrant up

It will automatically build the VMs environment according to the files description.
Some command

    vagrant status   # see the status of the VMs
    vagrant reload    # reload the VM after the VagrantFile get modified
    vagrant suspend  # suspend the VMs
    vagrant destroy  # destroy the VMs
    vagrant box list # (global command (*)) see the available box in vagrant
    vagrant global-status # (global command (*)) see all the existing VMs
    vagrant ssh # connect to a VM

(\*) dont need to be in vagrant repo (i.e. where there is a Vagrant File)

# KVM/QEMU provider

    apt install virt-manager
    vagrant plugin install vagrant-libvirt
    vagrant plugin install vagrant-mutate
    #systemctl enable libvirtd

    # NFS issue
    maybe: echo "NEED_STATD=yes" >> /etc/default/ngs-common 
    maybe: echo "config.vm.synced_folder "~/src/data/vagrant_virt", "/home/vagrant/vagrant_projects", type: "nfs", nfs_version: 4, "nfs_udp": false, mount_options: ["rw", "vers=4", "tcp", "nolock"]" >> Vagrantfile

Fix kvn mount timeout issue (`mount.nfs: Connection timed out`)

    iptables -A INPUT -p tcp --dport 2049 -j ACCEPT # NFS
    iptables -A INPUT -p tcp --dport 111 -j ACCEPT # RPC-Bind
    iptables -A INPUT -p tcp --dport 20048 -j ACCEPT # mountd

## Utils

    vagrant plugin install vagrant-scp
    vagrant scp <some_local_file_or_dir> <somewhere_on_the_vm>

@deprecated

Copy a file a VM. (obtain the port with `vagrant port`)

    scp -P 2222 vagrant@127.0.0.1:/vagrant/some-file.txt .

Get IP addresse of VM

    $(vagrant ssh-config | awk 'NR>1 {print " -o "$1"="$2}')

Or more generaly

    vagrant upload local_file [detination] vm-name


work around apt error “repository no longer has a Release file”

    apt get update --allow-releaseinfo-change

**UI**

in VagrantFile

    config.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
        vb.gui = true
        # Customize the amount of memory on the VM:
        vb.memory = "1024"
    end
    config.ssh.forward_agent = true
    config.ssh.forward_x11 = true


install i3

    apt install i3 xterm lightdm

