# Workflow:
make setup -> first run to install develop dependencies
make build -> first run and any time that has dockerfile modifications
make up -> run docker containers in dev mode
make prod -> not really being used but is suposed to run containers in prod mode
make heroku -> build heroku container, push to registry and release to production dyno
make down -> stop all containers

# TODO

[] - make command to deploy prod container to heroku
[] - gh actions to run make above
[] - www.admin.thiagoportfolio.me

# Things to learn

[] - class
[] - componet
[] - directive
[] - enum
[] - guards
[] - interceptors
[] - interfaces
[] - modules
[] - pipes
[] - resolvers
[] - services
[] - service-workers
[] - web-workers