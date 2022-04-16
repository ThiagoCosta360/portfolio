.PHONY:	$(wildcard @docker/*.dockerfile)

# Intall docker dependencies
setup:
	chmod +x ./@scripts/linux_setup.sh
	./@scripts/linux_setup.sh

# Run docker-compose on DEV mode
up:
	docker-compose -f ./@docker/docker-compose.yml -p portfolio --env-file ./@env/dev.env up

# Stop all running containers of docker compose
down:
	docker-compose -f ./@docker/docker-compose.yml -p portfolio down

# Run docker-compose on PROD mode
prod:
	cd front; ng build --prod
	docker-compose -f ./@docker/docker-compose.yml -p portfolio --env-file ./@env/prod.env up nginx

# Build all docker files on docker-path
docker-path = @docker
dockerfile-list = $(wildcard $(docker-path)/*.dockerfile)
build: $(dockerfile-list)
$(dockerfile-list):
	docker build -f $@ .

#Build single docker file on docker-path
%.dockerfile:
	docker build -f $@ $(docker-path)