#!/bin/bash
backupFolder=$(ls ~/*/ | grep -o -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}")
lastBackupTimeSeconds=0
lastBackupfolder=""
report="$HOME/backup-report"

if [[$backupFolder]]
then
lastBackupFolder=$(echo "$backupFolder" | tail -1)
lastBackupDate=$(echo "$lastBackupFolder" | grep -o -E "[0-9]{4}-[0-9]{2}-[0-9]{2}")
lastBackupTime=$(date -d $lastBackupDate +%s)
fi

current_date=$(date +%Y-%m-%d)
current_time_seconds=$(date -d $current_date +%s)

source="$HOME/source"
if ! [[ -d "$source" ]]; then
echo "Source not exists"
exit 1
fi
report="$HOME/backup-report"

if [[ $current_time_seconds - gt $(($lastBackupTime+7*24*60*60)) ]]; then
  backup_directory_path="$HOME/Backup-$current_date"
  mkdir $backup_directory_path
  BackupRenewed=true
else
backup_directory_path="$HOME/$lastBackupFolder"
fi

cd "$source"
files=$(find . -type f)

if [[ $BackupRenewed == true ]]; then
  echo "$backup_directory_path. Time: $current_date" >> $report
  for file in $files; do
    cp --parents "$file" "$backup_directory_path/"
    echo "$file was succesfully copied. Time: $current_date" >> $report
  done
else
  for file in $files; do
    if [[ -e "$backup_directory_path/$file" ]]; then
    oldsize=$(stat -c%s "$backup_directory_path/$file")
    newsize=$(stat -c%s "$source/$file")
    if [[ $oldsize -ne $newsize ]]; then
    mv "$backup_directory_path/$file" "$backup_directory_path/$file.$current_date"
    cp "$source/$file" "$backup_directory_path/$file"
    echo "$file was renamed to $file.$current_date. Time: $current_date" >> $report
    echo "$file was copied to $backup_directory_path. Time: $current_date" >> $report
    fi
    else
    cp --parents "$file" "$backup_directory_path/"
    echo "$file was succesfully copied to $backup_directory_path. Time: $current_date"
    fi
done
fi
