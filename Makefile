# Nome del servizio
SERVICE_NAME = handle_backend

# ENV ?= local

# Comandi
build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down --volumes

logs:
	docker-compose logs -f

shell:
	docker-compose exec $(SERVICE_NAME) bash

migrate:
	docker-compose exec $(SERVICE_NAME) php artisan migrate

composer-install:
	docker-compose exec $(SERVICE_NAME) composer install

yarn-install:
	docker-compose exec $(SERVICE_NAME) yarn install

# Altri comandi possono essere aggiunti qui
