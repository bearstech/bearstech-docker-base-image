all: jessie stretch latest

latest:
	docker tag bearstech/debian:stretch bearstech/debian:latest

jessie:
	./build-docker-image-bearstech -t bearstech/debian:jessie debootstrap.bearstech jessie

stretch:
	./build-docker-image-bearstech -t bearstech/debian:stretch debootstrap.bearstech stretch

clean:
	rm -rf /var/tmp/docker-mkimage.*
