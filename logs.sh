#!/bin/bash

DATE=$(date +"%d-%m-%H-%M")
FILE='warning-'$DATE'.log'

# Check if log file exists
COMMAND='sudo journalctl -p "warning".."emerg"'

# Check if theres any logs
if [ -z "$(eval "$COMMAND | head -5")" ] ; then
        echo "NO LOGS YAY"
        exit 0 # exit normally, no logs to check
fi

# Create File and add log contents to filea
touch $FILE && echo $(eval "$COMMAND") >> $FILE

# move to appropriate directory
mv $FILE ~/.config/logs/
exit 0 # exit normally
