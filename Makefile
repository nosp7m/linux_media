MOD := tbs6205se
obj-m := $(MOD).o
$(MOD)-objs := tbsecp3-core.o tbsecp3-cards.o tbsecp3-i2c.o tbsecp3-dma.o tbsecp3-dvb.o tbsecp3-asi.o cxd2878.o
ccflags-y := -Wno-unused-variable -Wno-unused-result -Wno-declaration-after-statement -Wno-switch
KERNEL_DIRECTORY := /lib/modules/$(shell uname -r)
all:
	$(MAKE) -C $(KERNEL_DIRECTORY)/build M=$(PWD) modules
install:
	mkdir -p $(KERNEL_DIRECTORY)/kernel/drivers/media/pci
	cp -vf $(MOD).ko $(KERNEL_DIRECTORY)/kernel/drivers/media/pci
	depmod
	modprobe $(MOD)
uninstall:
	modprobe -r $(MOD)
	rm -f $(KERNEL_DIRECTORY)/kernel/drivers/media/pci/$(MOD).ko
	depmod
clean:
	$(MAKE) -C $(KERNEL_DIRECTORY)/build M=$(PWD) clean
