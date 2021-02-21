#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
cd openwrt
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
sed -i '/uci commit luci/i\uci set luci.main.mediaurlbase="/luci-static/argon"' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\chown -R root:root /usr/share/netdata/web' package/lean/default-settings/files/zzz-default-settings
sed -i '/exit/i\find /etc/rc.d/ -name *docker* -delete' package/lean/default-settings/files/zzz-default-settings
sed -i 's/option fullcone\t1/option fullcone\t0/' package/network/config/firewall/files/firewall.config
sed -i '/find.*wlan.*wc/a\WIFI_NUM=0' package/base-files/files/root/setup.sh
sed -i '/8.8.8.8/d' package/base-files/files/root/setup.sh
echo 'wireguard' > package/base-files/files/etc/modules.d/10_wireguard
