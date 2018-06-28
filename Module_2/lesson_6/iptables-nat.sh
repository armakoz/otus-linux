#!/bin/bash
external_ip="10.211.6.42" 

iptables -t nat -A PREROUTING -d $external_ip -p tcp -m tcp --dport 8080 -j DNAT --to-destination 192.168.0.2:80
iptables -t nat -A POSTROUTING -d 192.168.0.2 -p tcp -m tcp --dport 80 -j SNAT --to-source 192.168.255.3
