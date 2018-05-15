#!/bin/bash

virt_swap=`vmware-toolbox-cmd stat swap | awk '{print $1}'`

if [[ $virt_swap == "0" ]]; then
    echo "OK - ${virt_swap}MB"
    exit 0
else
    echo "WARNING - ${virt_swap}MB (Сервер в swap виртуализации)"
    exit 1
fi