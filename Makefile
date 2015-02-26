all: usage

usage:
	@echo "make config-iso|config-usb|build|build-iso|build-usb|clean|distclean"

config: clean
	sudo lb config
build: config
	sudo lb build

config-iso: clean
	lb config --binary-images iso
build-iso: config-iso
	sudo lb build
config-usb: clean
	lb config --binary-images hdd
build-usb: config-usb
	sudo lb build

clean:
	sudo lb clean
	sudo rm -f *.log

distclean: clean
	sudo lb clean --purge --all
	sudo rm -f *.iso *.img *.list *.packages *.buildlog *.md5sum
	sudo rm -f config/binary
	sudo rm -f config/bootstrap
	sudo rm -f config/chroot
	sudo rm -f config/common
	sudo rm -f config/source
	sudo rm -f config/build
