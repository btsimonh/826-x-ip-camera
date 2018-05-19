#!/bin/sh
echo test >/tmp/custom_after_start

# set root password back to root every 10 seconds
echo \#!/bin/sh >/bin/dev_pwd.sh
echo while true >>/bin/dev_pwd.sh
echo do >>/bin/dev_pwd.sh
echo   echo setting root pwd to root >>/bin/dev_pwd.sh
echo   "echo \"root:root\"|chpasswd" >>/bin/dev_pwd.sh
echo   sleep 10 >>/bin/dev_pwd.sh
echo done >>/bin/dev_pwd.sh
echo  >>/bin/dev_pwd.sh
chmod 777 /bin/dev_pwd.sh
/bin/dev_pwd.sh &
tcpsvd -vE 0.0.0.0 21 ftpd -w / &


