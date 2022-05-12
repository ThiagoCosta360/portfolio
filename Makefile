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

# Install dependencies from back and front
i:
	cd front; npm i
	cd back; npm i

build-front:
	cd front; ng build
	cp -TR ./front/dist/ ./dist/front/

build-back:
	cd back; nest build
	cp -TR ./back/dist/ ./dist/back/
	cp ./back/package.json ./dist/back/package.json 
	cd ./dist/back; npm install --only=prod --force

# Build all docker files on docker-path -> make up
docker-path = @docker
dockerfile-list = $(wildcard $(docker-path)/*.dockerfile)
build: $(dockerfile-list)
$(dockerfile-list):
	docker build -f $@ .

# Build single docker file on docker-path
%.dockerfile:
	docker build -f $@ $(docker-path)

# Login in heroku registry
heroku-login:
	heroku login
	heroku login -i
	docker login --username=_ --password=$(heroku auth:token) registry.heroku.com

# Setup project on heroku
heroku: build-front build-back
	docker build -t registry.heroku.com/portfolio-360/web -f ./@heroku/Dockerfile .
	docker push registry.heroku.com/portfolio-360/web
	heroku container:release web -a portfolio-360

# Setup heroku container locally
heroku-test: build-front build-back
	docker stop heroku-test || true
	docker rm heroku-test || true
	docker build -t registry.heroku.com/portfolio-360/web -f ./@heroku/Dockerfile .
	docker run \
		--name heroku-test \
		-p 6464:80 \
		-e DATABASE_URL='postgresql://postgres-user:postgres-pass@172.17.0.1:5454/postgres-db' \
		-e MODE='dev' \
		registry.heroku.com/portfolio-360/web

# Show horoku logs
heroku-logs:
	heroku logs -n 300 -a portfolio-360

# Run postgres auxiliar container
# DATABASE_URL='postgresql://postgres-user:postgres-pass@172.17.0.1:5454/postgres-db'
postgres:
	docker run \
    --name local-postgres \
    -p 5454:5432 \
    -e POSTGRES_USER=postgres-user \
    -e POSTGRES_PASSWORD=postgres-pass \
    -e POSTGRES_DB=postgres-db \
    -d \
    postgres

# rm all docker containers and volumes
docker-nuke:
	docker container stop $$(docker ps -a -q) || true
	docker container rm $$(docker ps -a -q) || true
	docker volume prune -f

# restart the container c on dev mode
restart:
	docker-compose -f ./@docker/docker-compose.yml -p portfolio --env-file ./@env/dev.env restart $(c) 
