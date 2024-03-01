obj-m = tbsci.o
ccflags-y = -Wno-unused-variable -Wno-unused-result
KVERSION = $(shell uname -r)
all:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules
install:
	mkdir -p /lib/modules/$(KVERSION)/kernel/drivers/media/pci
	cp -vf tbsci.ko /lib/modules/$(KVERSION)/kernel/drivers/media/pci
	depmod
	modprobe tbsci
uninstall:
	modprobe -r tbsci
	rm -f /lib/modules/$(KVERSION)/kernel/drivers/media/pci/tbsci.ko
	depmod
clean:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) clean
