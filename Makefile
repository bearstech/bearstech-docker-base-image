all: jessie stretch

jessie:
	./build-docker-image-bearstech -t bearstech/debian:jessie debootstrap.bearstech jessie
	docker tag bearstech/debian:jessie bearstech/debian:8

jessie-test:
	docker run -ti --rm bearstech/debian:jessie cat /etc/debian_version

stretch:
	./build-docker-image-bearstech -t bearstech/debian:stretch debootstrap.bearstech stretch
	docker tag bearstech/debian:stretch bearstech/debian:latest
	docker tag bearstech/debian:stretch bearstech/debian:9

stretch-test:
	docker run -ti --rm bearstech/debian:stretch cat /etc/debian_version

test: jessie-test stretch-test

jessie-push:
	docker push bearstech/debian:jessie
	docker push bearstech/debian:8

stretch-push:
	docker push bearstech/debian:stretch
	docker push bearstech/debian:9
	docker push bearstech/debian:latest

push: jessie-push stretch-push

clean:
	rm -rf /var/tmp/docker-mkimage.*
