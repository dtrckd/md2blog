
docker pull

    docker pull postgres
    mkdir -p $HOME/docker/volumes/postgres

docker run

    docker run --rm   --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data  postgres


connect

    psql -h localhost -U postgres -d postgres
