#!/bin/bash

if [[ $1 == 'inetRouter' ]]; then
    rm -f /etc/sysconfig/network-scripts/ifcfg-eth1
    cat <<EOT >> /etc/sysconfig/network-scripts/ifcfg-eth1
        DEVICE=eth1 
        ONBOOT=yes 
        SLAVE=yes 
        MASTER=bond0 
        BOOTPROTO=none  
EOT
    cat <<EOT >> /etc/sysconfig/network-scripts/ifcfg-eth2
        DEVICE=eth2 
        ONBOOT=yes 
        SLAVE=yes 
        MASTER=bond0 
        BOOTPROTO=none
EOT
    cat <<EOT >> /etc/sysconfig/network-scripts/ifcfg-bond0
        DEVICE="bond0" 
        ONBOOT=yes 
        TYPE=Bond 
        BONDING_MASTER=yes 
        IPADDR=192.168.255.1 
        PREFIX=30 
        BOOTPROTO=static 
        BONDING_OPTS="mode=1 miimon=100 fail_over_mac=1" 
EOT
    service network restart
fi

if [[ $1 == 'centralRouter' ]]; then
    rm -f /etc/sysconfig/network-scripts/ifcfg-eth1
    cat <<EOT >> /etc/sysconfig/network-scripts/ifcfg-eth1
        DEVICE=eth1 
        ONBOOT=yes 
        SLAVE=yes 
        MASTER=bond0 
        BOOTPROTO=none  
EOT
    cat <<EOT >> /etc/sysconfig/network-scripts/ifcfg-eth7
        DEVICE=eth7 
        ONBOOT=yes 
        SLAVE=yes 
        MASTER=bond0 
        BOOTPROTO=none
EOT
    cat <<EOT >> /etc/sysconfig/network-scripts/ifcfg-bond0
        DEVICE="bond0" 
        ONBOOT=yes 
        TYPE=Bond 
        BONDING_MASTER=yes 
        IPADDR=192.168.255.2
        GATEWAY=192.168.255.1 
        PREFIX=30 
        BOOTPROTO=static 
        BONDING_OPTS="mode=1 miimon=100 fail_over_mac=1" 
EOT
    systemctl restart network
fi
