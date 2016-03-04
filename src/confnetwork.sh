#!bin/sh
#If /etc/config/network file has preconfig wan sittings then delete it.
uci delete network.wan
uci commit network
#this is a sample for Netkeeper in Chongqing on OpenWRT
uci set network.netkeeper=interface
uci set network.netkeeper.ifname=eth0.2
uci set network.netkeeper.macaddr=aabbccddeeff
uci set network.netkeeper.proto=pppoe
#TODO:set your province's plugin name
uci set network.netkeeper.pppd_options='plugin chongqing_sxplugin.so'
#TODO:set pppoe account and password
uci set network.netkeeper.username=username
uci set network.netkeeper.password=password
uci set network.netkeeper.metric='0'
uci commit network
#set firewall                                    
uci set firewall.@zone[1].network='wan netkeeper' 
uci commit firewall
/etc/init.d/firewall restart
/etc/init.d/network reload
/etc/init.d/network restart
