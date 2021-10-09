# Scripts for Vera usage as ser2net server

All file paths are relative to / on filesystem.


# Steps
1. upgrade/downgrade to required firmware
2. set network config via interface or manually via ssh
3. copy all .sh files in /usr/bin
4. edit all files so they start with
`
#!/bin/sh

sleep 10
exit 0
`
3. copy all files back to controller
4. edit /etc/crontabs/root and comment out all lines ( so they start with # )
5. add a new line `*/1 * * * * /bin/sh /root/check.sh > /dev/null 2>&1`
6. put files from above in their place
7. enjoy

If you need 2 ports to be forded (zwave and zigbee, for example) just copy files and run the pairs twice (two crontab, 4 files, each check referencing the correct check_once)
