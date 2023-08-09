include .docker/.env

DOCKER_DIR			= ".docker"
DOCKER_EXE			= docker
DOCKER_COMPOSE_EXE	= $(if $(shell which docker-compose),docker-compose,docker compose)
DC					= $(DOCKER_COMPOSE_EXE) --project-directory=$(DOCKER_DIR) --file="$(DOCKER_DIR)/docker-compose.yaml"
APP_CONTAINER		= "application"

.DEFAULT_GOAL      = help

.PHONY: help
help:
	@echo -e '\033[1m make [TARGET] \033[0m'
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' Makefile | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'


.PHONY: build
build: ## Build app image
	@BUILD_TARGET=dev $(DC) build

.PHONY: init
init: up ## Init
	@$(DC) exec $(APP_CONTAINER) bash -c "cd gateway && npm install"


.PHONY: up
up: ## Start the project docker containers
	@$(DC) up -d

.PHONY: down
down: ## Remove the docker containers
	@$(DC) down


.PHONY: console
console: ## Enter into application container
	@$(DC) exec -it $(APP_CONTAINER) bash

.PHONY: start
start: ## Run application (gateway)
	@$(DC) exec $(APP_CONTAINER) bash -c "cd gateway && npm start"