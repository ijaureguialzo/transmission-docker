#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info }
	@echo Opciones:
	@echo ---------------------------------
	@echo start / stop / restart / stop-all
	@echo workspace
	@echo update
	@echo logs / stats
	@echo clean
	@echo ---------------------------------

_header:
	@echo ------------
	@echo Transmission
	@echo ------------

start:
	@docker compose up -d --remove-orphans

stop:
	@docker compose stop

restart: stop start

stop-all:
	@docker stop `docker ps -aq`

workspace:
	@docker compose exec transmission /bin/sh

update:
	@docker compose pull

logs:
	@docker compose logs

stats:
	@docker stats

clean:
	@docker compose down -v --rmi all
