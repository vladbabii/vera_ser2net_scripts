# Scripts for Vera usage as ser2net server

All file paths are relative to / on filesystem.

# Files
* /root/check.sh - runs continously and runs check_once with a delay so things get restarted as fast as possible. it also checks if it's already running so it does not get started twice
* /root/check_once.sh - runs once when requested and checks if ser2net is started with the correct port ( 7676 ) for zwave
* /etc/crontabs/root - schedules /root/checks.sh to run once a minute

# Effects
* check if something listens on port 7676
* if there's nothing started set zwave led off then sernet is started with specific parameters then set zwave led on
* if it's started set zwave led on


# Installation
1. upgrade/downgrade to required firmware
2. set network config via interface or manually via ssh
3. copy all .sh files in /usr/bin
4. edit all files so they start with (keep existing first line)
```
#!/bin/sh

sleep 10
exit 0

.. rest of code goes here
````
5. copy all files back to controller
6. edit /etc/crontabs/root and comment out all lines ( so they start with # )
7. add a new line `*/1 * * * * /bin/sh /root/check.sh > /dev/null 2>&1`
8. put files from above in their place
9. enjoy

If you need 2 ports to be forded (zwave and zigbee, for example) just copy files and run the pairs twice (two crontab, 4 files, each check referencing the correct check_once)
