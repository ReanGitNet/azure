#!/bin/bash

systemctl stop chronyd
systemctl disable chronyd
yum install ntpd
sed -i 's/server/#server/g' /etc/ntp.conf
sed -i '26i\server 10.124.4.15 iburst\
server 10.124.4.4 iburst' /etc/ntp.conf
systemctl enable ntpd
systemctl start ntpd
reboot