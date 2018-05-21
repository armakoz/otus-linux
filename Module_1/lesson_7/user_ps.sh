#!/bin/bash
pid=`pidof -s $1`
#pid=$(ps ax | grep "nginx: master" | grep -v grep | awk '{print $1}')


status=`cat /proc/$pid/status | grep "Name"`
state=`cat /proc/$pid/status | grep State`
ppid=`cat /proc/$pid/status | grep PPid`
cmd=`cat /proc/$pid/cmdline`
nchild=`ps --ppid $pid --no-headers | wc --lines`




echo $status
echo "Procces $ppid"
echo "Procces PID: $pid"
echo "Proccess state: $state"
echo "CMD parametres: $cmd"
echo "Number of child: $nchild"

echo "==============="
echo "USE FILES"

ls -l /proc/$pid/fd
