@slef-hosting

install 

    sh -c "APP=dppm-static $(wget -qO- https://raw.githubusercontent.com/DFabric/apps-static/master/helper.sh)"
    sudo dppm-static_VERSION/bin/dppm install


See configuration of a service

    dppm a c get etherpad
    # dppm app config ...

See logs of a service

    dppm a L etherpad [output|error]
    # dppm app logs ...

Status/start/stop a service
    
    dppm S status|start|stop etherpad
    dppm Service ...

Execute an app

    dppm a e etherpad
    # dppm app execute ...


Use a reverse proxy for app (drawio example, static project)

    dppm app add caddy name=caddy 
    dppm app add drawio name=drawio web_server=caddy url=http://127.0.0.1/
    dppm service start caddy

update source 

    dppm s u
    # dppm source update


install dppm to new defined prefix

    dppm a i
    # dppm app install





