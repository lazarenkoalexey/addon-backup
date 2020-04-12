#!/bin/bash

set -x
set -e

host=$(hostname -a)


crontab -u root -l | grep -v '/var/log/first-backup.log'  | crontab -u root -

touch /home/plan.json

. /root/.config/swissbackup/openrc.sh

eval "/usr/bin/restic backup --hostname $host --tag filesystem --one-file-system /"


sleep 5

restic unlock

eval "/usr/bin/restic forget --tag filesystem --keep-hourly 24 --keep-daily 7 --keep-weekly 4 --keep-monthly 6 --keep-yearly 3 --prune"


> /home/plan.json

function loopOverArray(){

   restic snapshots --json | jq -r '.?' | jq -c '.[]'| while read i; do
         id=$(echo "$i" | jq -r '.| .short_id')
         ctime=$(echo "$i" | jq -r '.| .time' | cut -f1 -d".")
         hostname=$(echo "$i" | jq -r '.| .hostname')
        paths=$(echo "$i" | jq -r '. | .paths | join(",")')

        printf "id: %-25s - %-35s - %-25s paths: %-10s \n" $id $ctime $hostname $paths >> /home/plan.json
         done
  }

   loopOverArray