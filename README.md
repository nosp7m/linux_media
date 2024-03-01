# Simplified Driver for the TBS6900

This branch contains a simplified version of the original TBS6900 driver in [tbsdtv/linux_media - drivers/media/pci/tbsci](https://github.com/tbsdtv/linux_media/tree/latest/drivers/media/pci/tbsci).

The following changes have been made:
- removed files which are not relevant for the TBS6900 driver
- changed the `/dev/dvb` device initialization to only create `ca*` and `sec*` devices (dropped anyway not available `demux*`, `frontend*`, etc.)
- added an easy to use `Makefile` (see below)

Build result is a single `tbsci.ko` kernel module file, ready to be used. No replacing of the whole Linux media drivers, no backports of patches, no long error prone builds, etc. And yes, I'm confident similar can be done for the other cards as well. I just don't have the hardware to test and make the drivers work.

# Build

- `make clean` to clean-up
- `make` to build

# Installation/Uninstallation

- `make install` (cp to /lib/modules + depmod + modprobe)
- `make uninstall` (modprobe + rm + depmod)
