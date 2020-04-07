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
