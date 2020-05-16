help:
	@echo 'Opciones:'
	@echo ''
	@echo 'start | stop | restart | stop-all'
	@echo 'password'
	@echo 'workspace'
	@echo 'stats'
	@echo 'clean'

start:
	@docker-compose up -d --remove-orphans

stop:
	@docker-compose stop

restart: stop start

stop-all:
	@docker stop `docker ps -aq`

workspace:
	@docker-compose exec transmission /bin/sh

stats:
	@docker stats

clean:
	@docker-compose down -v

password:
	@read -p "Username: " username; \
	read -sp "Password: " password; \
	docker-compose exec transmission configure "$$username" "$$password";
