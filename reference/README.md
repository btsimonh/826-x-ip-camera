To extract the firmware image:

connect serial (the obvious 3 holes in the board) @ 115kbaud

press any key to break into uboot.


To dump COMPLETE 

sf read 0x02000000 0 1000000

insert empty SD card

mmc write 0x02000000 0 0x8000

move SD card to windows, ignore format request

use roadkill diskimager to image physical disk to file ('cancel' after file > 16m)

use HxD to cut file to 16M

separate patritions according to table in boot dump

use 7zip to view/extract squashfs fs portion

To extract jffs2, on linux use:

sudo modprobe mtdram total_size=32768

sudo dd if=user0.img of=/dev/mtdblock0

mkdir fs

sudo mount -t jffs2 /dev/mtdblock0 ./fs

