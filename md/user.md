@linux
@bash


Add new user (with HOME !)

    adduser newuser


With privilege

    usermod -aG sudo newuser


Remove user

    deluser --remove-home username

remove group

    delgroup GROUPNAME


Make passwordless sudo

    echo "alice ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/alice
    sudo chmod 0440 /etc/sudoers.d/alice
