COMPOSE_FILE=./srcs/docker-compose.yml

up:
	docker-compose -f ${COMPOSE_FILE} up
