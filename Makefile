all: usage

check:
	@echo -n "Check package depndencies "
	@dpkg -l isolinux 2>&1 1>/dev/null
	@dpkg -l syslinux-common 2>&1 1>/dev/null
	@dpkg -l pxelinux 2>&1 1>/dev/null
	@dpkg -l live-build 2>&1 1>/dev/null
	@dpkg -l live-config 2>&1 1>/dev/null
	@dpkg -l live-boot 2>&1 1>/dev/null
	@dpkg -l live-boot-initramfs-tools 2>&1 1>/dev/null
	@dpkg -l live-tools 2>&1 1>/dev/null
	@dpkg -l live-image-xfce-desktop 2>&1 1>/dev/null
	@echo "... OK"

usage:
	@echo "make config|build|clean|distclean"

config: check clean copy splash
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
	sudo rm -fr config/includes.chroot/etc
	sudo rm -fr config/includes.chroot/usr
	sudo rm -fr config/includes.chroot/.gitignore
	sudo rm -fr config/bootloaders

copy:
	[ ! -d includes.chroot ] || \
	  rsync -auvz includes.chroot/ config/includes.chroot/

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
	rsync -auvz -C \
	  --exclude SIGEN.htm \
	  --exclude .gitignore \
	dennou-k.gfd-dennou.org:/GFD_Dennou_Club/ftp/arch/cc-env/live-usb-dvd/includes.chroot/ \
	includes.chroot/
	rm -f includes.chroot/Makefile
	rm -f includes.chroot/SIGEN.htm
