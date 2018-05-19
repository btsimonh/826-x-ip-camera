#!/bin/sh
echo test >/tmp/custom_pre_start


# knobble network to local lan only
# remove up to three default gateways
echo ip route del default >>/project/apps/app/ipc/data/sh/dns_apply.sh
echo ip route del default >>/project/apps/app/ipc/data/sh/dns_apply.sh
echo ip route del default >>/project/apps/app/ipc/data/sh/dns_apply.sh
# add a specific route to 0.uk.pool.ntp.org
echo route add 85.199.214.102 gw 192.168.1.1  >>/project/apps/app/ipc/data/sh/dns_apply.sh

echo "/bin/hostname \${prompt}\${promp_eth}\${promp_wifi}" >> /project/apps/app/ipc/data/sh/dev_passwd.sh
echo "echo \"root:root\"|chpasswd" >> /project/apps/app/ipc/data/sh/dev_passwd.sh




