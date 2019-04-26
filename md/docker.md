@recipes
@docker

# Docker Recipes

###### Show objects
list (all) ontainers:

    docker ps -a

list (all) images:

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

Remove all exited containers

    docker ps -aq -f status=exited

Remove stopped containers

    docker ps -aq --no-trunc | xargs docker rm




Remove all images:

    docker rmi $(docker images -q)

Remove dangling/untagged images
    docker images -q --filter dangling=true | xargs docker rmi



Remove unused volumes:

    find '/var/lib/docker/volumes/' -mindepth 1 -maxdepth 1 -type d | grep -vFf <(
            docker ps -aq | xargs docker inspect | jq -r '.[] | .Mounts | .[] | .Name | select(.)'
            ) | xargs -r rm -fr

# Use cases

## mongodb

Mongodb provides an official containe r that will be automagically downladed. (you can just instal `mongodb-clients`

    docker run -d -p 27017:27017 -v ~/src/data/mongo-docker:/data/db mongo
