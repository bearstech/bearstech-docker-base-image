jessie: /usr/share/docker-engine/contrib/mkimage/debootstrap.bearstech
	./build-docker-image-bearstech debootstrap.bearstech jessie

/usr/share/docker-engine/contrib/mkimage/debootstrap.bearstech:
	ln -s `pwd`/debootstrap.bearstech /usr/share/docker-engine/contrib/mkimage/
