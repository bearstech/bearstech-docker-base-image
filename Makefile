all: build

build: jessie stretch

pull:
	printf "Nothing to pull\\n"

bt_tool_build:
	docker build \
		-t bt_tool_build \
		-f Dockerfile.tool \
		.

jessie: bt_tool_build
	docker run --privileged --rm \
		-v `pwd`:/work \
		-v /var/run/docker.sock:/var/run/docker.sock \
		bt_tool_build \
		jessie_real

stretch: bt_tool_build
	docker run --privileged --rm \
		-v `pwd`:/work \
		-v /var/run/docker.sock:/var/run/docker.sock \
		bt_tool_build \
		stretch_real

jessie_real:
	./build-docker-image-bearstech -t bearstech/debian:jessie debootstrap.bearstech jessie
	docker tag bearstech/debian:jessie bearstech/debian:8

stretch_real:
	./build-docker-image-bearstech -t bearstech/debian:stretch debootstrap.bearstech stretch
	docker tag bearstech/debian:stretch bearstech/debian:latest
	docker tag bearstech/debian:stretch bearstech/debian:9

jessie-test:
	docker run --rm bearstech/debian:jessie cat /etc/debian_version

stretch-test:
	docker run --rm bearstech/debian:stretch cat /etc/debian_version

tests: jessie-test stretch-test

push:
	docker push bearstech/debian:jessie
	docker push bearstech/debian:8
	docker push bearstech/debian:stretch
	docker push bearstech/debian:9
	docker push bearstech/debian:latest

remove_image:
	docker rmi bearstech/debian:jessie
	docker rmi bearstech/debian:8
	docker rmi bearstech/debian:stretch
	docker rmi bearstech/debian:9
	docker rmi bearstech/debian:latest

clean:
	rm -rf /var/tmp/docker-mkimage.*
