COMPOSE_FILE=./srcs/docker-compose.yml

up:
	docker-compose -f ${COMPOSE_FILE} up

up-detached:
	docker-compose -f ${COMPOSE_FILE} up -d

down:
	docker-compose -f ${COMPOSE_FILE} down

stop:
	docker-compose -f ${COMPOSE_FILE} stop

build:
	docker-compose -f ${COMPOSE_FILE} build

clean:
	docker-compose -f ${COMPOSE_FILE} down --volumes --remove-orphans

logs:
	docker-compose -f ${COMPOSE_FILE} logs

logs-follow:
	docker-compose -f ${COMPOSE_FILE} logs -f

status:
	docker-compose -f ${COMPOSE_FILE} ps

restart:
	docker-compose -f ${COMPOSE_FILE} down
	docker-compose -f ${COMPOSE_FILE} up -d
