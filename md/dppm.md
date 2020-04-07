@self-hosting

# Install

install 

    sh -c "APP=dppm-static $(wget -qO- https://raw.githubusercontent.com/DFabric/apps-static/master/helper.sh)"
    sudo dppm-static_VERSION/bin/dppm install

# Update

install dppm to new defined prefix

    dppm a i


update source 

    dppm s u

# Usage

add an application

    dppm app add caddy name=caddy 


Use a reverse proxy for app (drawio example, static project)

    dppm app add drawio name=drawio web_server=caddy url=http://127.0.0.1:8996/
    dppm service start caddy

See config of a service

    dppm a c get APPLICATION_NAME .

See logs of a service

    dppm a L APPLICATION_NAME [output|error]

Status/start/stop a service
    
    dppm S status|start|stop etherpad
    dppm Service ...

Execute an app

    dppm a e etherpad







