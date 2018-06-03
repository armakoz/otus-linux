#!/bin/bash

if [[ $1 == 'testClient1' ]]; then
    rm -f /etc/sysconfig/network-scripts/ifcfg-eth2
    cat <<EOT >> /etc/sysconfig/network-scripts/ifcfg-eth2
        ONBOOT=yes 
        BOOTPROTO=none 
        DEVICE=eth2 
        NM_CONTROLLED=no 
EOT
    cat <<EOT >> /etc/sysconfig/network-scripts/ifcfg-eth2.1
        ONBOOT=yes 
        VLAN=yes 
        BOOTPROTO=static 
        TYPE=Ethernet 
        DEVICE=eth2.1 
        NM_CONTROLLED=no 
        IPADDR=10.10.10.254 
        PREFIX=24 
EOT
    systemctl restart network
fi

if [[ $1 == 'testServer1' ]]; then
    rm -f /etc/sysconfig/network-scripts/ifcfg-eth2
    cat <<EOT >> /etc/sysconfig/network-scripts/ifcfg-eth2
        ONBOOT=yes 
        BOOTPROTO=none 
        DEVICE=eth2 
        NM_CONTROLLED=no 
EOT
    cat <<EOT >> /etc/sysconfig/network-scripts/ifcfg-eth2.1
        ONBOOT=yes 
        VLAN=yes 
        BOOTPROTO=static 
        TYPE=Ethernet 
        DEVICE=eth2.1 
        NM_CONTROLLED=no 
        IPADDR=10.10.10.1 
        PREFIX=24 
EOT
    systemctl restart network
fi

if [[ $1 == 'testClient2' ]]; then
    rm -f /etc/sysconfig/network-scripts/ifcfg-eth2
    cat <<EOT >> /etc/sysconfig/network-scripts/ifcfg-eth2
        ONBOOT=yes 
        BOOTPROTO=none 
        DEVICE=eth2 
        NM_CONTROLLED=no 
EOT
    cat <<EOT >> /etc/sysconfig/network-scripts/ifcfg-eth2.2
        ONBOOT=yes 
        VLAN=yes 
        BOOTPROTO=static 
        TYPE=Ethernet 
        DEVICE=eth2.2 
        NM_CONTROLLED=no 
        IPADDR=10.10.10.254 
        PREFIX=24 
EOT
    systemctl restart network
fi

if [[ $1 == 'testServer2' ]]; then
    rm -f /etc/sysconfig/network-scripts/ifcfg-eth2
    cat <<EOT >> /etc/sysconfig/network-scripts/ifcfg-eth2
        ONBOOT=yes 
        BOOTPROTO=none 
        DEVICE=eth2 
        NM_CONTROLLED=no 
EOT
    cat <<EOT >> /etc/sysconfig/network-scripts/ifcfg-eth2.2
        ONBOOT=yes 
        VLAN=yes 
        BOOTPROTO=static 
        TYPE=Ethernet 
        DEVICE=eth2.2 
        NM_CONTROLLED=no 
        IPADDR=10.10.10.1 
        PREFIX=24 
EOT
    systemctl restart network
fi