#!/bin/bash

# MAKE OPEN DIRECTORY DB BACKUP EVERY DAY
path="/path/to/save"
dateDB=`date "+%Y_%m_%d_%H%M"`
dateDir=`date "+%Y_%m"`
# ASSIGN PASSWORD TO THE BACKUP
db_pass="password"

# IF NOT EXIST CREATE A FOLDER PER MONTH
[ ! -d  $path/OpenDiretoryDB_$dateDir ] && `mkdir -p $path/OpenDirectoryDB_$dateDir`

# SET TIME OUT TO ALLOW FINISH THE DUMP 
expect -c "
  set timeout 150
  spawn /usr/sbin/slapconfig -backupdb \"$path/OpenDirectoryDB_$dateDir/db_backup_$dateDB\"
  expect \"Enter archive password:\"
  send \"$db_pass\r\"
  expect eof
  exit
" >> $path/db_backup.log 2>&1

if [ $? -eq 0 ] && [ -e $path/OpenDirectoryDB_$dateDir/db_backup_$dateDB.sparseimage ]
then
  echo "`date` Backup od_backup_$dateDB created successfully" >> $path/db_backup.log 2>&1
  exit 0
else
  echo "`date` Backup od_backup_$dateDB fail" >> $path/db_backup.log 2>&1
  exit 1
fi
