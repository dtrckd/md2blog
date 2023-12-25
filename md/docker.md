@recipes
@docker

# Docker Recipes

Show the root command of each container

    docker inspect -f "{{.Name}} {{.Path}} {{.Args}}" $(docker ps -q)


Show the ip address use to reach a container (like a mysql server)

    docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mydb

## Cleaning

**images**
clean unused images

    docker image prune -f

Remove all images:

    docker rmi $(docker images -q)

Remove dangling/untagged images

    docker images -q --filter dangling=true | xargs docker rmi

**container**
remove all exited container

    docker rm $(docker ps -a -f status=exited -q)

Remove all stopped containers

    docker rm $(docker ps -aq --no-trunc)

Remove all containers:

    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)

**volume**
Prune volume 

    docker volume prune

clean unused volumes, containers and images

    docker system prune --all --force --volumes

Remove all volume

    docker volume rm $(docker volume ls -q)
    # or docker-compose down -v

Remove unused volumes (docu ?):

    find '/var/lib/docker/volumes/' -mindepth 1 -maxdepth 1 -type d | grep -vFf <(
            docker ps -aq | xargs docker inspect | jq -r '.[] | .Mounts | .[] | .Name | select(.)'
            ) | xargs -r rm -fr

## Show objects
list (all) ontainers:

    docker ps -a

list (all) images:

    docker images -a   # docker image ls

Rename an image:

    docker tag d583c3ac45fad(image_id) myname/server:latest

Show docker disk image 

    docker system df

Show volumes

    docker volume ls

Show container file creation since started

    docke diff <container name>

## Backup objects

    docker export container-id | gzip > backup.tar.gz
    zcat backup.tar.gz | docker import - repository[:tag]


## Interact with Objects

Run a container:

    docker run [-i|d] [--rm] [--name container-id] repository

Enter inside a container:

    docker exec -it container-id bash


# Use cases

## mongodb

Mongodb provides an official container that will be automagically downladed. (you can just instal `mongodb-clients`)

    docker run -d -p 27017:27017 -v ~/src/data/mongo-docker:/data/db mongo
