#!/bin/bash

echo "Script name: run centos 7"
echo "*************************"

mkdir -p $(pwd)/docker
mkdir -p $(pwd)/amazon


docker rm -f am2-systemd

docker volume create \
	--driver local \
	-o o=bind \
	-o type=none \
	-o device=$(pwd)/docker \
	docker

docker volume create \
	--driver local \
	-o o=bind \
	-o type=none \
	-o device=$(pwd)/amazon \
	amazon

docker run \
	-dit \
	--name=am2-dkm \
	--hostname=am2dkm \
	--privileged \
	-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
	-v /tmp/$(mktemp -d):/run \
	-v docker:/var/lib/docker:rw \
	-v amazon:/home/amazon:rw \
	am2-dkmachine:dev