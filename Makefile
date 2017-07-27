all: jessie stretch

jessie: /usr/share/docker-engine/contrib/mkimage/debootstrap.bearstech
	./build-docker-image-bearstech -t bearstech/debian:jessie debootstrap.bearstech jessie

stretch: /usr/share/docker-engine/contrib/mkimage/debootstrap.bearstech
	./build-docker-image-bearstech -t bearstech/debian:stretch debootstrap.bearstech stretch

/usr/share/docker-engine/contrib/mkimage/debootstrap.bearstech:
	ln -s `pwd`/debootstrap.bearstech /usr/share/docker-engine/contrib/mkimage/
