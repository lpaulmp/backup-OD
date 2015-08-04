#!/bin/bash

# MAKE OPEN DIRECTORY DB BACKUP EVERY DAY
path="/path/to/save"
dateDB=`date "+%Y_%m_%d_%H%M"`
dateDir=`date "+%Y_%m"`
# ASSIGN PASSWORD TO THE BACKUP
db_pass="password"

# IF NOT EXIST CREATE A FOLDER PER MONTH
[ ! -d  $path/OpenDiretoryDB_$dateDir ] && `mkdir -p $path/OpenDirectoryDB_$dateDir`

expect -c "
        spawn slapconfig -backupdb \"$path/OpenDirectoryDB_$dateDir/db_backup_$dateDB\"
        expect \"Enter archive password:\"
        send \"$db_pass\r\"
        interact
" >> $path/db_backup.log 2>&1

echo "`date` Backup od_backup_$dateDB created successfully" >> $path/db_backup.log 2>&1
