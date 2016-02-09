all: usage

usage:
	@echo "make config|build|clean|distclean"

config: clean sync
	sudo lb config
build: config
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

sync:
	rsync -auvz -C \
	  --exclude SIGEN.htm \
	dennou-k.gfd-dennou.org:/GFD_Dennou_Club/ftp/arch/cc-env/live-usb-dvd/includes.chroot/ \
	config/includes.chroot/
	rm -f config/includes.chroot/Makefile
	rm -f config/includes.chroot/SIGEN.htm
