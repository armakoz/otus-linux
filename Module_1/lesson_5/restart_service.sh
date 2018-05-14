#!/bin/bash

var service=your_service
ps aux | grep $service | grep -v grep > /dev/null

if [ $? != 0 ]
then
        /etc/init.d/$service start > /dev/null
fi