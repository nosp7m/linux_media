# Simplified Driver for the TBS6205SE

This branch contains a simplified version of the original TBS6205SE driver in [tbsdtv/linux_media - drivers/media/pci/tbsecp3](https://github.com/tbsdtv/linux_media/tree/latest/drivers/media/pci/tbsecp3).

The following changes have been made:
- removed files which are not relevant for the TBS6205SE driver
- added an easy to use `Makefile` (see below)

Build result is a single `tbs6205se.ko` kernel module file, ready to be used. No replacing of the whole Linux media drivers, no backports of patches, no long error prone builds, etc. And yes, I'm confident similar can be done for the other cards as well. I just don't have the hardware to test and make the drivers work.

# Build

- `make clean` to clean-up
- `make` to build

# Installation/Uninstallation

- `make install` (cp to /lib/modules + depmod + modprobe)
- `make uninstall` (modprobe + rm + depmod)
