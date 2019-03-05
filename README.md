# Harbor

**In development**

A simple docker (swarm) web management interface, just deploy to docker

## Get started

1. Get Docker
2. `docker-compose build`
3. `docker-compose run harbor-web npm install` Get web-ui dependencies
4. `docker-compose run harbor-api mix deps.get` Get api dependencies
5. `docker-compose run harbor-api mix ecto.create` Create DB
6. `docker-compose up`

*Note*: Windows users need to run `$env:COMPOSE_CONVERT_WINDOWS_PATHS=1` so that the Docker Engine API socket can mount.
