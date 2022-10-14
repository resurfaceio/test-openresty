PROJECT_NAME=openresty

start:
	@docker stop resurface || true
	@docker build -t test-openresty --no-cache .
	@docker-compose up --detach

stop:
	@docker-compose stop
	@docker-compose down --volumes --remove-orphans
	@docker image rmi -f test-openresty

bash:
	@docker exec -it openresty_with_logger bash

logs:
	@docker logs -f openresty_with_logger

ping:
	@curl "http://localhost:8000/"

restart:
	@docker-compose stop
	@docker-compose up --detach

test:
	@docker exec -it openresty_with_logger resty tests/test_resurfaceio.lua