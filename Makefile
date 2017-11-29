rootfs:
	$(eval TMPDIR := $(shell mktemp -d))
	pacstrap -C /usr/share/devtools/pacman-extra.conf -c -d -G -M $(TMPDIR) $(shell cat packages)
	cp --recursive --preserve=timestamps --backup --suffix=.pacnew rootfs/* $(TMPDIR)/
	arch-chroot $(TMPDIR) /bin/sh -c 'ls -d /usr/share/locale/* | egrep -v "en_U|alias" | xargs rm -rf'
	arch-chroot $(TMPDIR) /bin/sh -c 'find /usr/share/terminfo/. ! -name "xterm*" ! -name "screen*" -type f -delete'
	arch-chroot $(TMPDIR) locale-gen
	arch-chroot $(TMPDIR) pacman-key --init
	arch-chroot $(TMPDIR) pacman-key --populate archlinux
	tar --numeric-owner --xattrs --acls --exclude-from=exclude -C $(TMPDIR) -c . -f archlinux.tar
	rm -rf $(TMPDIR)

.PHONY: rootfs
