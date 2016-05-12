Chameleon Cloud
================

::

    sudo lshs -short

::

    H/W path    Device  Class      Description
    ------------------------------------------
                        system     OpenStack Nova ()
    /0                  bus        Motherboard
    /0/0                memory     96KiB BIOS
    /0/401              processor  Intel Xeon E312xx (Sandy Bridge)
    /0/402              processor  Intel Xeon E312xx (Sandy Bridge)
    /0/1000             memory     4GiB System Memory
    /0/1000/0           memory     4GiB DIMM RAM
    /0/100              bridge     440FX - 82441FX PMC [Natoma]
    /0/100/1            bridge     82371SB PIIX3 ISA [Natoma/Triton II]
    /0/100/1.1          storage    82371SB PIIX3 IDE [Natoma/Triton II]
    /0/100/1.2          bus        82371SB PIIX3 USB [Natoma/Triton II]
    /0/100/1.3          bridge     82371AB/EB/MB PIIX4 ACPI
    /0/100/2            display    GD 5446
    /0/100/3    eth0    network    Virtio network device
    /0/100/4            storage    Virtio block device
    /0/100/5            generic    Virtio memory balloon

::

     description: CPU
       product: Intel Xeon E312xx (Sandy Bridge)
       vendor: Intel Corp.
       physical id: 401
       bus info: cpu@0
       slot: CPU 1
       size: 2GHz
       capacity: 2GHz
       width: 64 bits

Suman Machine
==============

::

    H/W path    Device      Class       Description
    -----------------------------------------------
                            system      Computer
    /0                      bus         Motherboard
    /0/0                    memory      993MiB System memory
    /0/1                    processor   Intel(R) Core(TM) i7-5500U CPU @ 2.40GHz
    /0/100                  bridge      440FX - 82441FX PMC [Natoma]
    /0/100/1                bridge      82371SB PIIX3 ISA [Natoma/Triton II]
    /0/100/1.1              storage     82371AB/EB/MB PIIX4 IDE
    /0/100/2                display     VirtualBox Graphics Adapter
    /0/100/3    eth0        network     82540EM Gigabit Ethernet Controller
    /0/100/4                generic     VirtualBox Guest Service
    /0/100/5                multimedia  82801AA AC'97 Audio Controller
    /0/100/6                bus         KeyLargo/Intrepid USB
    /0/100/7                bridge      82371AB/EB/MB PIIX4 ACPI
    /0/100/d                storage     82801HM/HEM (ICH8M/ICH8M-E) SATA Controller [AHCI mode]
    /0/2        scsi1       storage
    /0/2/0.0.0  /dev/cdrom  disk        DVD reader