rem qemu-img create -f vmdk hd.vmdk 2G
rem qemu-system-i386w -L bios -cdrom dsl-n-01RC4.iso -hdb hd.vmdk

rem qemu-img convert -O vmdk PureDarwin.iso PureDarwin.vmdk
rem qemu-system-ppcw -L bios -hdb puredarwinxmas.vmdk

rem qemu-system-ppcw -prom-env 'auto-boot?=false' -prom-env 'boot-device=hd:2,\yaboot' -prom-env 'boot-args=conf=hd:2,\yaboot.conf'
qemu-system-i386w -L bios -hda puredarwinxmas.vmdk -cdrom puredarwinxmas.iso -boot d -m 512


