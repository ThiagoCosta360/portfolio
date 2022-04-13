setup:
	chmod +x ./@scripts/linux_setup.sh
	./@scripts/linux_setup.sh

up:
	docker-compose -f ./@docker/docker-compose.yml -p portfolio --env-file ./@env/.env up

down:
	docker-compose -f ./@docker/docker-compose.yml -p portfolio down

prod:
	cd front; ng build --prod
	