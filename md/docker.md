@recipes
@docker

# Docker Recipes

###### Show objects
list containers:

    docker ps

list images (non running containers):

    docker images -a

Rename an image:

    docker tag d583c3ac45fad(image_id) myname/server:latest

###### Backup objects
    docker export container-id | gzip > backup.tar.gz
    zcat backup.tar.gz | docker import - repository[:tag]


###### Interact with Objects
Run a container:

    docker run [-i|d] repository [--name container-id] 

Enter inside a container:

    docker exec -it container-id bash

Remove all containers:

    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)

Remove all images:

    docker rmi $(docker images -q)

Remove unused volumes:

    find '/var/lib/docker/volumes/' -mindepth 1 -maxdepth 1 -type d | grep -vFf <(
            docker ps -aq | xargs docker inspect | jq -r '.[] | .Mounts | .[] | .Name | select(.)'
            ) | xargs -r rm -fr
