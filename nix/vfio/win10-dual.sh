#!/bin/sh

# Start QEMU
qemu-system-x86_64 \
    -enable-kvm \
    -boot menu=on \
    -m 8G \
    -smp cores=2,threads=2,sockets=1,maxcpus=4 \
    -cpu host,kvm=off,check \
    -machine type=q35,accel=kvm \
    -name win10-nvidia \
    -rtc base=localtime,clock=host \
    -device piix3-usb-uhci \
    -device usb-tablet \
    -drive if=pflash,format=raw,readonly,file=/usr/share/OVMF/OVMF_CODE.fd \
    -drive file='win10.img',if=ide,format=raw,index=4,media=disk,cache=writeback \
    -cdrom /opt/distr/os/win10.iso \
    -device ioh3420,bus=pcie.0,addr=1c.0,multifunction=on,port=1,chassis=1,id=root \
    -device vfio-pci,host=01:00.0,bus=root,addr=00.0,multifunction=on \
    -device vfio-pci,host=01:00.1,bus=root,addr=00.1 \
    -vga qxl \
    -net nic \
    -net user,smb=/opt \
