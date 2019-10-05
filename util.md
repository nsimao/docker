## docker

- execute an additional command in a container

`docker exec -it container_id command`
or
`docker run -it busybox sh`

- running in background `-d`
`docker run redis - d`

- specifying port `-p`

`docker run -p 8080:8080 image_id`

- specifying volumes `-v`

`pwd`: means present working directory, doesn't work on Windows. 

`docker run -p 3000:3000 -v $(pwd):/app myimage`

`docker run -p 3000:3000 -v /app/node_modules -v C:\ME\personal\GitHub\docker\frontend:/app 0231b207e779                                       `

when there is no use of `:`, ex: `-v /app/node_modules`, docker preserves the directory.
- stop

`docker stop container-id`

- remove

`docker rm container-id`

- build image

`docker build -t user/image:version .`

`-t`: image name

- build image with custom name `-f`

`docker build -f Dockerfile.dev -t user/image:version .`

## docker-compose

- Start all: `docker compose up`.

`docker run myimage` == `docker-compose up`

- Build with `docker-compose`
`docker-compose up --build`

- run at background 
`docker-compose up -d`

- stop 
`docker-compose down`

- status of containers specified at docker-compose
`docker-compose ps`