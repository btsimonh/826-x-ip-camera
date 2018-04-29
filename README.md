# 826-x-ip-camera

This repo is about an IP camera I just bought on Amazon for £29.99 delivered.

https://www.amazon.co.uk/gp/product/B074M71BRF/ref=oh_aui_detailpage_o01_s00?ie=UTF8&psc=1

Mine was branded 'OnvianTech 1080P Wi-Fi IP Security Camera', but also known as 'Pannovo 826-x', 'FUJIKAM CCTV Security 1080P 2.0MP WiFi IPCamera'.

The camera works with https://www.mipcm.com, however there is no information about the security of the camera, or what they may do with your data.

So; before attaching it to my wireless network, I'm going to have  to break into it to see what it's made of.

It does have a local webpage which works with PC but not with mobile browsers.  The mipc PC app is a wrapped html app.

The local webpage is mainly a javascript application, and as such is relatively esy to debug into in order to examine the protocols involved.

More worrying is that the camera does talk to mipc servers, at least for firmware updates, but it sends a fair bit of encrypted data to the servers, so without convincing documentation or evidence, this data is not to be trusted.

