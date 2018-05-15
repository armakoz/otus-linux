#!/bin/bash

COMMAND=$(ntpq -pn | grep -F '*' | awk '{print $1}' | cut -d "*" -f 2)
OFFSET=$(ntpq -pn | grep -F '*' | awk '{print $9}')

if [ -z "$COMMAND" ]
then
        echo "No synchronization with the time server"
        exit 2

else
        echo "Synchronized with the server: "$COMMAND" offset: "$OFFSET
        exit 0
fi