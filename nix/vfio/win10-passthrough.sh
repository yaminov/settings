#!/bin/bash

# looking glass stuff
#if [ ! -f /dev/shm/looking-glass ]; then
#    touch /dev/shm/looking-glass
#    chown kamil:kvm /dev/shm/looking-glass
#    chmod 660 /dev/shm/looking-glass
#fi

qemu-system-x86_64 \
    -enable-kvm \
    -boot menu=on \
    -m 8G \
    -smp cores=2,threads=2,sockets=1,maxcpus=4 \
    -cpu host,kvm=off,check \
    -machine type=q35,accel=kvm \
    -name win10-intel \
    -rtc base=localtime,clock=host \
    -device piix3-usb-uhci \
    -drive if=pflash,format=raw,readonly,file=/usr/share/OVMF/OVMF_CODE.fd \
    -drive file='/mnt/nvme/images/vdi/win10/win10.img',if=ide,format=raw,index=4,media=disk,cache=writeback \
    -cdrom /opt/distr/os/win10.iso \
    -device ioh3420,bus=pcie.0,addr=1c.0,port=1,chassis=1,id=root \
    -device vfio-pci,host=00:02.0,bus=root,addr=00.0 \
    -vga qxl \
    -net nic \
    -net user,restrict=on,hostfwd=tcp:127.0.0.1:3389-:3389 \
#    -net user,hostfwd=tcp:127.0.0.1:3389-:3389,smb=/mnt/nvme/pro \
# looking glass stuff
#    -vga qxl -spice port=5900,addr=127.0.0.1,disable-ticketing \
#    -device ivshmem-plain,memdev=ivshmem,bus=pcie.0 \
#    -object memory-backend-file,id=ivshmem,share=on,mem-path=/dev/shm/looking-glass,size=32M \
# mouse and keyboard passthrough
#    -device usb-host,vendorid=0x046d,productid=0xc05b \
#    -device usb-host,vendorid=0x1a2c,productid=0x0021 \

