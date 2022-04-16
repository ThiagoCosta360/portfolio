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
prod:	build-front
	docker-compose -f ./@docker/docker-compose.yml -p portfolio --env-file ./@env/prod.env up nginx

build-front:
	cd front; ng build --prod

# Build all docker files on docker-path
docker-path = @docker
dockerfile-list = $(wildcard $(docker-path)/*.dockerfile)
build: $(dockerfile-list)
$(dockerfile-list):
	docker build -f $@ .

#Build single docker file on docker-path
%.dockerfile:
	docker build -f $@ $(docker-path)

heroku: build-front
	docker build -t registry.heroku.com/portfolio-360/web -f ./@heroku/Dockerfile .
	docker push registry.heroku.com/portfolio-360/web
	heroku container:release web -a portfolio-360