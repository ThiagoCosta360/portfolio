#!/bin/bash

## Docker

	sudo apt-get update

	sudo apt-get install \
	ca-certificates \
	curl \
	gnupg \
	lsb-release

	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

	sudo add-apt-repository \
	"deb [arch=arm64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable"

	sudo apt-get update

	sudo apt-get install docker-ce docker-ce-cli containerd.io

	curl -fsSL https://get.docker.com -o ./scripts/get-docker.sh

	sudo sh /scripts/get-docker.sh

	sudo usermod -aG docker $USER

## Docker compose

	sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

	sudo chmod +x /usr/local/bin/docker-compose