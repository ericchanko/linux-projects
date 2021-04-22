#!/bin/bash

COUNT=$(eval "ls ~/.config/logs | wc -l")

if [ $COUNT -lt 5 ]; then
        echo "NO NEED TO DO ANYTHING YAY"
        exit 0 # exit normally
fi

# Gotta do stuff now
NEWFOLD='backups-'$(date +"%d_%m")

# check if directory doesnt exist
if [ ! -d "~/.config/backup-logs"$NEWFOLD ]; then
        echo "MAKING FOLDER"
        mkdir $NEWFOLD
        # make directory now then move after everything is moved into thi
else
        echo "Directory already exists, cannot backup for the day"
        exit 1
fi

# move files in directory ~/.config/logs/ to directory now
mv -v ~/.config/logs/* $NEWFOLD

# compress folder into #NEWFOLD.tar and delete the old folder only if compression succeeds
tar -czvf $NEWFOLD'.tar' $NEWFOLD && rm -r $NEWFOLD

# copy folder to ~/.config/backup-logs/
rsync -a $NEWFOLD'.tar' ~/.config/backup-logs/
