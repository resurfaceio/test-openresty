PROJECT_NAME=openresty

start:
	@docker stop resurface || true
	@docker build -t test-openresty --no-cache .
	@docker compose up --detach

stop:
	@docker compose stop
	@docker compose down --volumes --remove-orphans
	@docker image rmi -f test-openresty

bash:
	@docker exec -it openresty_with_logger bash

logs:
	@docker logs -f openresty_with_logger

ping:
	@curl "http://localhost:8000/"

restart:
	@docker compose stop
	@docker compose up --detach

test:
	@docker exec -it openresty_with_logger /bin/sh -c "cd /usr/local/openresty/luajit/lib/luarocks/rocks-5.1/resurfaceio-logger/2.0-0/ && resty tests/test.lua"