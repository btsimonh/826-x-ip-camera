# 826-x-ip-camera

This repo is about an IP camera I just bought on Amazon for £29.99 delivered.

If you have an interest in this or a similar camera (one which uses www.mipc.com), add to the issue I've raised.  Depending upon interest, I'll publish more....

https://www.amazon.co.uk/gp/product/B074M71BRF/ref=oh_aui_detailpage_o01_s00?ie=UTF8&psc=1

Mine was branded 'OnvianTech 1080P Wi-Fi IP Security Camera', but also known as 'Pannovo 826-x', 'FUJIKAM CCTV Security 1080P 2.0MP WiFi IPCamera'.

It's Grain 8136s based with ethernet, wifi, USB OTG and SD card, with pan and tilt, dubbed a 'Cloud Camera'.

The camera works with https://www.mipcm.com, however there is no information about the security of the camera, or what they may do with your data.

So; before attaching it to my wireless network, I'm going to have  to break into it to see what it's made of.

It does have a local webpage which works with PC but not with mobile browsers.  The mipc PC app is a wrapped html app.

The local webpage is mainly a javascript application, and as such is relatively easy to debug into in order to examine the protocols involved.

More worrying is that the camera does talk to mipc servers, at least for firmware updates, but it sends a fair bit of encrypted data to the servers, so without convincing documentation or evidence, this data is not to be trusted.

I have obtained an incremental firmware update file (ipc_pack_patch_from_v4.6.2.1706161621.rtl8188fu_to_v5.1.5.1803281502.rtl8188fu.bin), which consists of several parts: an lzma compressed patch to patch a tar file, an executable, a script, and a CRC, plus a few numbers...  A full firmware file is elusive.

A few days of effort revealed a mechanism for replacing the script file in the upgrade file, which opens up the ability to run telnet/ftp and have root access.


Login screen
```<removed>@<removed>@m@u@e.<removed> login: root
Password:
login: can't chdir to home directory '/root'

|---------------------------------------------------------------------------|
| Welcome to                                                                |
|                                                                           |
|                    A                                                      |
|                   AAA                                                     |
|                  AAAAA                                                    |
|                 AAAAAAA                                                   |
|                AAAA   AA                                                  |
|         A     AAAA     AA                                                 |
|        AAA   AAAA       AA          AAA   AAAAA    AAA   AAAAA    AAAAA   |
|       AAAAA AAAA         AA              AA   AA        AA   AA  AA   AA  |
|      AAAAAAAAAA           AA        AAA  AA   AA   AAA  AA   AA  AA   AA  |
|     AAAAA AAAA             AA       AAA  AA   AA   AAA  AA   AA  AA   AA  |
|    AAAAA    A               AA      AAA  AA   AA   AAA  AA   AA   AAAAAA  |
|   AAAAA                      AA     AAA  AA   AA   AAA  AA   AA       AA  |
| AAAAAA                        AAAA  AAA  AA   AA   AAA  AA   AA  AAAAAA   |
|===========================================================================|
|                                                                           |
|                                             http://www.shenzhenmining.com |
|                                           power by (C)shenzhenmining 2015 |
|---------------------------------------------------------------------------|




BusyBox v1.20.1 (2015-03-29 21:56:34 HKT) built-in shell (ash)
Enter 'help' for a list of built-in commands.
```

current status: root prompt, ability to start ftpd, etc.


# Update - root access without serial.

I have uploaded two 'upgrade' files for different versions of this camera.  These enable root telnet access plus allow for further customisation, see 'upgrade_hacks' folder.

