# test-openresty
Example of NGINX OpenResty data capture integration

## Requirements
- docker
- docker-compose

## Ports Used
- 8000 - OpenResty
- 7700 - Resurface UI
- 7701 - Resurface capture microservice

## Deploy locally
```
make start     # rebuild and start containers
make ping      # make simple ping request
make bash      # open shell session
make logs      # follow container logs
make stop      # halt and remove containers
```