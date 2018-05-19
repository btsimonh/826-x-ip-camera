# modification scripts

These are the modification scripts I'm currently using.

# custom_pre_upgrade.sh

currently I don't use this script, as I can't modify files which have not yet been extracted...

# custom_pre_start.sh

This script runs after the files have been extracted from the upgrade, but before the system is formally started.  So it is an ideal pplace to make additional modifications to the system scripts before they are used.

In this script, I modify 

```
/project/apps/app/ipc/data/sh/dns_apply.sh
```

to remove all default gateways (up to three) using `ip route del default`.  This make sit such that the camera cannot talk beyond the local LAN, so protecting your privacy.

I also add a default route for a time server using: `route add 85.199.214.102 gw 192.168.1.1`.  

Remember, these changes are being done in `dns_apply.sh`, and so should be run every time the network changes?

Then the script modifies `/project/apps/app/ipc/data/sh/dev_passwd.sh`.  This is the script which sets a randomised root password on the camera.  I add to the end of the script to force the root password back to `root`.

# custom_after_start.sh

This script still currently contains the creation and activation of a script to set the root password to root every 10 seconds :).  This should no longer be necessary with the mods to `dev_passwd.sh`.

It also starts the ftp daemon `tcpsvd -vE 0.0.0.0 21 ftpd -w / &` allowing easy access to change these scripts, and analysis of the filesystem.




