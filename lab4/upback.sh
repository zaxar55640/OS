#!/bin/bash
folderToRestore=~/reestore
lastBackupDate=$(ls ~ | grep -e "^Backup-" | sort -n -r | head -1 |sed "s/^Backup-//")
lastBackup=~/Backup-$lastBackupDate

if ! [[ -z $lastBackupDate ]]; then
if ! [[ -d $folderToRestore ]]; then
mkdir $folderToRestore
fi
for file in $(ls $lastBackup | grep -E -v "[0-9]{4}-[0-9]{2}-[0-9]{2}"); do
cp $lastBackup/$file $folderToRestore/$file
done
fi
