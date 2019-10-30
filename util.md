## docker

### docker

- execute an additional command in a container

`docker exec -it container_id command`
or
`docker run -it busybox sh`

- running in background / `detached` mode `-d`
`docker run redis - d`

- specifying port `-p`

`docker run -p 8080:8080 image_id`

- specifying volumes `-v`

`pwd`: means present working directory, doesn't work on Windows. 

`docker run -p 3000:3000 -v $(pwd):/app myimage`

`docker run -p 3000:3000 -v /app/node_modules -v C:\ME\personal\GitHub\docker\frontend:/app nsimao/frontend`                                      ``

when there is no use of `:`, ex: `-v /app/node_modules`, docker preserves the directory from the container.

- stop

`docker stop container-id`

- remove

`docker rm container-id`

- build image

`docker build -t user/image:version .`

`-t`: image name

- build image with custom name `-f`

`docker build -f Dockerfile.dev -t user/image:version .`

- volumes to databases

For a DVC (Data Volume Container), try docker volume create:

`docker volume create mongodbdata`

Then use it as:

`docker run -p 27017:27017 -v mongodbdata:/data/db`

### docker-compose

https://docs.docker.com/compose/reference/overview/

- Start: `docker compose up`.

`docker run myimage` == `docker-compose up`

- specifying filename `-f`: 

`docker-compose -f docker-compose-dev.yml up`.

- Build with `docker-compose`
`docker-compose up --build`

- run at background 
`docker-compose up -d`

- stop 
`docker-compose down`

- status of containers specified at docker-compose
`docker-compose ps`


## k8s

### kubectl

- feed a config file to kubectl
`kubectl apply -f <filename>`, example: `kubectl apply -f client-pod.yaml`

- print the status of all running pods
`kubectl get <object_type>`, example: `kubectl get pods`

- print the status of all running services
`kubectl get services`

- get detailed info about an object
`kubectl describe <object_type> <object_name>`, example: `kubectl describe pod client-pod`

- delete an object

`kubectl delete -f <filename>`, example: `kubectl delete -f client-pod.yaml`

- creating a secret

`kubectl create secret <type_of_secret> <secret_name> --from-literal key=value`, example: `kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf`

`--from-literal`: we are going to add the secret information into this command, as opposed to from . file.