#!/bin/sh
COUNT=$( ps aux | grep -v -e "grep" | grep "check.sh" | wc -l )
if [ "$COUNT" == "2" ] ; then
  while true
  do
    /bin/sh /root/check_once.sh
    sleep 5
  done
else
  echo "Already started ( count = $COUNT )"
fi
