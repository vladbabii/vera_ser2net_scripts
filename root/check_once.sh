#!/bin/sh
COUNT=$( netstat -a | grep -i listen | grep -i "0.0.0.0:7676" | wc -l )
echo "Found $COUNT lines of port :7676"
if [ "$COUNT" == "0" ] ; then
  /usr/bin/set_led.sh off zwave
  echo "Starting... :7676"
  ser2net -C "7676:raw:0:/dev/ttyS0:115200 8DATABITS NONE 1STOPBIT"
else
  /usr/bin/set_led.sh on zwave
  echo "Already started :7676"
fi
