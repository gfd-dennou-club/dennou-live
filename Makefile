all: usage

check:
	@echo -n "Check package depndencies "
	@dpkg -l apt-cacher-ng 2>&1 1>/dev/null
	@dpkg -l isolinux 2>&1 1>/dev/null
	@dpkg -l syslinux-common 2>&1 1>/dev/null
	@dpkg -l pxelinux 2>&1 1>/dev/null
	@dpkg -l live-build 2>&1 1>/dev/null
	@dpkg -l live-config 2>&1 1>/dev/null
	@dpkg -l live-boot 2>&1 1>/dev/null
	@dpkg -l live-boot-initramfs-tools 2>&1 1>/dev/null
	@dpkg -l live-tools 2>&1 1>/dev/null
	@echo "... OK"

usage:
	@echo "make config|build|clean|distclean"

config: check clean
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

splash: check
	[ ! -f splash.svg ] || \
	  rsync -auv -L \
	   /usr/share/live/images/xfce-desktop/config/bootloaders \
	   config/
	[ ! -f splash.svg ] || \
	  cp -v splash.svg config/bootloaders/extlinux/
	[ ! -f splash.svg ] || \
	  cp -v splash.svg config/bootloaders/isolinux/
	[ ! -f splash.svg ] || \
	  cp -v splash.svg config/bootloaders/pxelinux/
	[ ! -f splash.svg ] || \
	  cp -v splash.svg config/bootloaders/syslinux/

sync:
	rsync -auvz -C --delete \
	  --exclude SIGEN.htm \
	  --exclude .gitignore \
	dennou-k.gfd-dennou.org:/GFD_Dennou_Club/ftp/arch/cc-env/live-usb-dvd/includes.chroot/ \
	config/includes.chroot/
	rm -f includes.chroot/Makefile
	rm -f includes.chroot/SIGEN.htm

resync:
	rsync -auvz -C --delete  \
	  config/includes.chroot/ \
	dennou-k.gfd-dennou.org:/GFD_Dennou_Club/ftp/arch/cc-env/live-usb-dvd/includes.chroot/
