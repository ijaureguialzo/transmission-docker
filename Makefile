help:
	@echo 'Opciones:'
	@echo ''
	@echo 'start | stop | restart | stop-all'
	@echo 'password'
	@echo 'workspace'
	@echo 'update'
	@echo 'logs'
	@echo 'stats'
	@echo 'clean'

start:
	@docker-compose up -d --remove-orphans

stop:
	@docker-compose stop

restart: stop start

stop-all:
	@docker stop `docker ps -aq`

password:
	@read -p "Username: " username; \
	read -p "Password: " password; \
	docker-compose exec transmission configure "$$username" "$$password";

workspace:
	@docker-compose exec transmission /bin/sh

_build:
	@docker-compose build --pull

update: _build start

logs:
	@docker-compose logs

stats:
	@docker stats

clean:
	@docker-compose down -v
